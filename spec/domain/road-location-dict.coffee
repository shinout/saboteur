

domain = require '../domain'
RoadLocation = domain.getModel 'road-location'

roadCardFactory = domain.createFactory 'road-card'

describe 'RoadLocationDict', ->

    beforeEach ->

        @roadCard = roadCardFactory.createWideT()
        @roadCard.upsideDown()

        @location = new RoadLocation(x: 4, y: -3, roadCard: @roadCard)

        @dict = domain.createFactory('road-card').createDict('road-location-dict')

        @dict.add @location

    describe '@key', ->

        it 'returns stringified location', ->

            expect(@dict.constructor.key(@location)).to.equal '4,-3'

    describe 'getByXY', ->

        it 'returns location by x, y', ->

            expect(@dict.getByXY(4, -3)).to.equal @location


        it 'returns undefined when location with x, y is not registered', ->

            expect(@dict.getByXY(4, -1)).to.be.undefined


    describe 'getCard', ->

        it 'returns road card by x, y', ->

            expect(@dict.getCard(4, -3)).to.equal @roadCard


        it 'returns undefined when location with x, y is not registered', ->

            expect(@dict.getCard(4, -1)).to.be.undefined



    describe 'getConnectedNeighbors', ->

        it 'returns connected locations', ->

            t = roadCardFactory.createT()
            t.upsideDown()
            upper = new RoadLocation(x: 4, y: -2, roadCard: t)


            horiEnd = roadCardFactory.createHorizontalDeadEnd()
            right = new RoadLocation(x: 5, y: -3, roadCard: horiEnd)

            vert = roadCardFactory.createVertical()
            left = new RoadLocation(x: 3, y: -3, roadCard: vert)


            allDead = roadCardFactory.createAllDirectionDeadEnd()
            lower = new RoadLocation(x: 4, y: -4, roadCard: allDead)

            @dict.add upper, right, left, lower

            neighbors = @dict.getConnectedNeighbors(@location)

            expect(neighbors).to.be.instanceof Array
            expect(neighbors).to.have.length 3
            expect(neighbors[0]).to.be.instanceof RoadLocation

            keys = (loc.toString() for loc in neighbors)

            expect(keys).to.eql ['4,-2', '4,-4', '5,-3']


    describe 'isHorizontallyConnected', ->

        it 'returns true when two cards are horizontally connected', ->

            leftEnd = roadCardFactory.createLeftDeadEnd()
            rightEnd = leftEnd.upsideDown()
            left = new RoadLocation(x: 4, y: 0, roadCard: rightEnd)

            hori = roadCardFactory.createHorizontal()
            right = new RoadLocation(x: 5, y: 0, roadCard: hori)

            expect(@dict.isHorizontallyConnected(left, right)).to.be.true


        it 'returns false when two cards are not horizontally connected', ->

            leftEnd = roadCardFactory.createLeftDeadEnd()
            left = new RoadLocation(x: 4, y: 0, roadCard: leftEnd)

            vert = roadCardFactory.createVertical()
            right = new RoadLocation(x: 5, y: 0, roadCard: vert)

            expect(@dict.isHorizontallyConnected(left, right)).to.be.false



    describe 'isVerticallyConnected', ->

        it 'returns true when two cards are vertically connected', ->

            upperEnd = roadCardFactory.createUpperDeadEnd()
            lowerEnd = upperEnd.upsideDown()
            upper = new RoadLocation(x: 6, y: 0, roadCard: lowerEnd)

            wideT = roadCardFactory.createWideT()
            lower = new RoadLocation(x: 6, y: -1, roadCard: wideT)

            expect(@dict.isVerticallyConnected(upper, lower)).to.be.true


        it 'returns false when two cards are not vertically connected', ->

            upperEnd = roadCardFactory.createUpperDeadEnd()
            upper = new RoadLocation(x: 6, y: 0, roadCard: upperEnd)

            hori = roadCardFactory.createHorizontal()
            lower = new RoadLocation(x: 6, y: -1, roadCard: hori)

            expect(@dict.isVerticallyConnected(upper, lower)).to.be.false


    describe 'isConnectedToNeighbors', ->

        it 'returns false when no neighbors are connected', ->

            expect(@dict.isConnectedToNeighbors(@location)).to.be.false

        it 'returns true when some neighbors are connected', ->

            cross = roadCardFactory.createCross()
            right = new RoadLocation(x: 5, y: -3, roadCard: cross)

            @dict.add right

            expect(@dict.isConnectedToNeighbors(@location)).to.be.true


    describe 'isCompatible', ->

        it 'returns false when no neighbors are connected', ->

            expect(@dict.isCompatible(@location)).to.be.false


        it 'returns false when connected to neighbors, but incompatible roads', ->

            # compatible
            cross = roadCardFactory.createCross()
            right = new RoadLocation(x: 5, y: -3, roadCard: cross)

            # incompatible
            hori = roadCardFactory.createHorizontal()
            upper = new RoadLocation(x: 4, y: -2, roadCard: hori)

            @dict.add right, upper

            expect(@dict.isConnectedToNeighbors(@location)).to.be.true

            expect(@dict.isCompatible(@location)).to.be.false


        it 'returns false when all neighbors are compatible', ->

            t = roadCardFactory.createT()
            t.upsideDown()
            upper = new RoadLocation(x: 4, y: -2, roadCard: t)


            horiEnd = roadCardFactory.createHorizontalDeadEnd()
            right = new RoadLocation(x: 5, y: -3, roadCard: horiEnd)

            vert = roadCardFactory.createVertical()
            left = new RoadLocation(x: 3, y: -3, roadCard: vert)


            allDead = roadCardFactory.createAllDirectionDeadEnd()
            lower = new RoadLocation(x: 4, y: -4, roadCard: allDead)

            @dict.add upper, right, left, lower

            expect(@dict.isConnectedToNeighbors(@location)).to.be.true
            expect(@dict.isCompatible(@location)).to.be.true
