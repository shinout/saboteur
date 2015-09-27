
domain = require '../domain'
Location = domain.getModel('location')

describe 'Location', ->

    describe 'toString', ->

        it 'returns "x, y"', ->

            location = new Location(x: 20, y: 19)

            expect(location.toString()).to.equal '20,19'

        it 'is called when location is regarded as string', ->

            location = new Location(x: -4, y: -60)

            expect(location + ' ').to.equal '-4,-60 '


    describe 'is', ->

        it 'returns true when x is same as @x and y also is', ->

            location = new Location(x: 6, y: -1)

            expect(location.is(6, -1)).to.be.true

        it 'returns false when x, y is not the same', ->

            location = new Location(x: 6, y: -1)

            expect(location.is(6, 0)).to.be.false



    describe 'isNeighbor', ->

        beforeEach ->

            @location = new Location(x: 3, y: -2)


        it 'returns false when xy is same', ->

            expect(@location.isNeighbor(3, -2)).to.be.false


        it 'returns true when x + 1, y', ->

            expect(@location.isNeighbor(4, -2)).to.be.true


        it 'returns true when x - 1, y', ->

            expect(@location.isNeighbor(2, -2)).to.be.true


        it 'returns true when x, y + 1', ->

            expect(@location.isNeighbor(3, -1)).to.be.true


        it 'returns true when x, y - 1', ->

            expect(@location.isNeighbor(3, -3)).to.be.true


        it 'returns false when x + 1, y - 1', ->

            expect(@location.isNeighbor(4, -3)).to.be.false


