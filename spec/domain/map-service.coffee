

domain = require '../domain'

roadCardFactory = domain.createFactory 'road-card'

MapService    = domain.getService('map')
GoalCard      = domain.getModel 'goal-card'
StartRoadCard = domain.getModel 'start-road-card'
RoadLocation  = domain.getModel 'road-location'
GoalLocation  = domain.getModel 'goal-location'

describe 'MapService', ->

    beforeEach ->

        @goalCards = [

            new GoalCard(isGenuineGoal: yes, left: on, right: on, upper: on, lower: on, center: on)
            new GoalCard(isGenuineGoal: no,  left: on, right: off, upper: on, lower: off, center: on)
            new GoalCard(isGenuineGoal: no,  left: on, right: off, upper: off, lower: on, center: on)
        ]

        @map = new MapService(@goalCards)


    describe 'constructor', ->

        it 'sets start location', ->

            expect(@map.startLocation).to.be.instanceof RoadLocation
            expect(@map.startLocation.x).to.equal 0
            expect(@map.startLocation.y).to.equal 0
            expect(@map.startLocation.roadCard).to.be.instanceof StartRoadCard



        it 'sets goal locations', ->

            expect(@map.goals).to.be.instanceof Array
            expect(@map.goals).to.have.length 3
            expect(@map.goals[0]).to.be.instanceof GoalLocation
            expect(@map.goals.some (goal) -> goal.goalCard.isGenuineGoal).to.be.true


            expect(@map.goals[0].x).to.equal 8
            expect(@map.goals[1].x).to.equal 8
            expect(@map.goals[2].x).to.equal 8

            expect(@map.goals[0].y).to.equal -2
            expect(@map.goals[1].y).to.equal 0
            expect(@map.goals[2].y).to.equal 2


    describe 'isLocatable', ->

        it 'returns false if the given card is not locatable', ->

            hori = roadCardFactory.createHorizontal()
            hori.isLocatable = no

            expect(@map.isLocatable(hori, 1, 0)).to.be.false


        it 'returns true if the given card is compatible to neighbor roads', ->

            hori = roadCardFactory.createHorizontal()
            expect(@map.isLocatable(hori, 1, 0)).to.be.true


        it 'returns false if the given card can connect to neighbors but incompatible', ->

            hori = roadCardFactory.createHorizontal()
            @map.locateCardTo(hori, 1, 0)

            cross = roadCardFactory.createCross()
            @map.locateCardTo(cross, 2, 0)

            allDead = roadCardFactory.createAllDirectionDeadEnd()
            @map.locateCardTo(allDead, 2, -1)

            wideT = roadCardFactory.createWideT()
            wideT.upsideDown()

            expect(@map.isLocatable(wideT, 1, -1)).to.be.false


        it 'returns true if the given card can connect to neighbors but incompatible, but allowIncompatible option is true', ->

            hori = roadCardFactory.createHorizontal()
            @map.locateCardTo(hori, 1, 0)

            cross = roadCardFactory.createCross()
            @map.locateCardTo(cross, 2, 0)

            allDead = roadCardFactory.createAllDirectionDeadEnd()
            @map.locateCardTo(allDead, 2, -1)

            wideT = roadCardFactory.createWideT()
            wideT.upsideDown()

            expect(@map.isLocatable(wideT, 1, -1, allowIncompatible: yes)).to.be.true



    describe 'locateCardTo', ->

        it 'throws an error if the given card is not locatable', ->

            hori = roadCardFactory.createHorizontal()
            hori.isLocatable = no

            expect(=> @map.locateCardTo(hori, 1, 0)).to.throw 'cannotLocate'

        it 'sets the given card to the location x, y', ->

            hori = roadCardFactory.createHorizontal()
            @map.locateCardTo(hori, 1, 0)
            expect(@map.locations.getByXY(1, 0)).to.exist
            expect(@map.locations.getCard(1, 0)).to.equal hori


    describe 'isReachable', ->

        it 'returns if given position is reachable', ->

            hori = roadCardFactory.createHorizontal()
            @map.locateCardTo(hori, 1, 0)

            cross = roadCardFactory.createCross()
            @map.locateCardTo(cross, 2, 0)

            allDead = roadCardFactory.createAllDirectionDeadEnd()
            @map.locateCardTo(allDead, 2, -1)

            wideT = roadCardFactory.createWideT()
            wideT.upsideDown()

            @map.locateCardTo(wideT, 2, -2)

            expect(@map.isReachable(2, -2)).to.be.false


    describe 'flipGoal', ->

        it 'throws an error when the given goal card is unflippable', ->

            goalLocation = @map.goals[1]

            expect(=> @map.flipGoal(goalLocation)).to.throw 'cannotFlip'


        it 'flips the given goal card at the location when flippable', ->

            for x in [1..7]
                hori = roadCardFactory.createHorizontal()
                @map.locateCardTo(hori, x, 0)

            goalLocation = @map.goals[1]

            expect(=> @map.flipGoal(goalLocation)).to.not.throw Error


        it 'flips the given goal card at the location when unflippable, but force option is given', ->

            goalLocation = @map.goals[1]

            expect(=> @map.flipGoal(goalLocation, force: true)).to.not.throw Error

        it 'returns if the goal card is genuine', ->

            expect(@map.flipGoal(@map.goals[0], force: true)).to.be.true

            expect(@map.flipGoal(@map.goals[1], force: true)).to.be.false

            expect(@map.flipGoal(@map.goals[2], force: true)).to.be.false


    describe 'remove', ->

        it 'throws an error when the card at x, y is unremovable', ->

            expect(=> @map.remove(0, 0)).to.throw 'cannotRemove'


        it 'throws an error when the card at x, y does not exist', ->

            expect(=> @map.remove(11, -2)).to.throw 'noCard'


        it 'removes the card at x, y', ->

            leftEnd = roadCardFactory.createLeftDeadEnd()
            @map.locateCardTo(leftEnd, 1, 0)

            expect(@map.locations.has('1,0')).to.be.true

            @map.remove(1, 0)

            expect(@map.locations.has('1,0')).to.be.false


