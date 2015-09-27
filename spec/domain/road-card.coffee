

domain = require '../domain'
RoadCard = domain.getModel('road-card')

describe 'RoadCard', ->

    describe 'isRemovable', ->

        it 'is true by default', ->

            card = new RoadCard(left: on, right: off, upper: off, lower:on, center: on)

            expect(card.isRemovable).to.be.true


    describe 'upsideDown', ->

        it 'upsideDowns the card', ->

            card = new RoadCard(left: on, right: off, upper: off, lower:on, center: on)

            card.upsideDown()

            expect(card.getAutoName()).to.equal 'l0-r1-u1-d0-c1'



    describe 'getAutoName', ->

        it 'returns name reflecting directional information', ->

            card = new RoadCard(left: on, right: off, upper: off, lower:on, center: on)

            expect(card.getAutoName()).to.equal 'l1-r0-u0-d1-c1'

