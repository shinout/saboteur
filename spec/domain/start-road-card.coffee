

domain = require '../domain'
StartRoadCard = domain.getModel('start-road-card')

describe 'StartRoadCard', ->

    describe 'getName', ->

        it 'returns "start"', ->

            card = new StartRoadCard()

            expect(card.getName()).to.equal 'start'


    describe 'isLocatable', ->

        it 'returns "yes"', ->

            card = new StartRoadCard()

            expect(card.isLocatable).to.be.true


    describe 'isDistributable', ->

        it 'returns "no"', ->

            card = new StartRoadCard()

            expect(card.isDistributable).to.be.false


    describe 'isRemovable', ->

        it 'returns "no"', ->

            card = new StartRoadCard()

            expect(card.isRemovable).to.be.false




