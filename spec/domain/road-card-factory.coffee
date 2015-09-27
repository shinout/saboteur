

domain = require '../domain'
factory = domain.createFactory('road-card')

describe 'RoadCardFactory', ->

    describe 'createHorizontal', ->

        it 'returns a road card', ->

            card = factory.createHorizontal()

            expect(card.getName()).to.equal 'l1-r1-u0-d0-c1'

    describe 'createVertical', ->

        it 'returns a road card', ->

            card = factory.createVertical()

            expect(card.getName()).to.equal 'l0-r0-u1-d1-c1'


    describe 'createL', ->

        it 'returns a road card', ->

            card = factory.createL()

            expect(card.getName()).to.equal 'l1-r0-u0-d1-c1'

            card.upsideDown()

            expect(card.getName()).to.equal 'l0-r1-u1-d0-c1'


    describe 'createInvertL', ->

        it 'returns a road card', ->

            card = factory.createInvertL()

            expect(card.getName()).to.equal 'l1-r0-u1-d0-c1'

            card.upsideDown()

            expect(card.getName()).to.equal 'l0-r1-u0-d1-c1'


    describe 'createCross', ->

        it 'returns a road card', ->

            card = factory.createCross()

            expect(card.getName()).to.equal 'l1-r1-u1-d1-c1'


    describe 'createT', ->

        it 'returns a road card', ->

            card = factory.createT()

            expect(card.getName()).to.equal 'l1-r1-u1-d0-c1'



    describe 'createWideT', ->

        it 'returns a road card', ->

            card = factory.createWideT()

            expect(card.getName()).to.equal 'l1-r0-u1-d1-c1'


    describe 'createLeftDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createLeftDeadEnd()

            expect(card.getName()).to.equal 'l1-r0-u0-d0-c0'



    describe 'createUpperDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createUpperDeadEnd()

            expect(card.getName()).to.equal 'l0-r0-u1-d0-c0'


    describe 'createHorizontalDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createHorizontalDeadEnd()

            expect(card.getName()).to.equal 'l1-r1-u0-d0-c0'


    describe 'createVerticalDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createVerticalDeadEnd()

            expect(card.getName()).to.equal 'l0-r0-u1-d1-c0'


    describe 'createLFormedDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createLFormedDeadEnd()

            expect(card.getName()).to.equal 'l1-r0-u0-d1-c0'


    describe 'createInvertedLFormedDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createInvertedLFormedDeadEnd()

            expect(card.getName()).to.equal 'l1-r0-u1-d0-c0'


    describe 'createTFormedDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createTFormedDeadEnd()

            expect(card.getName()).to.equal 'l1-r1-u1-d0-c0'


    describe 'createWideTFormedDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createWideTFormedDeadEnd()

            expect(card.getName()).to.equal 'l1-r0-u1-d1-c0'


    describe 'createAllDirectionDeadEnd', ->

        it 'returns a road card', ->

            card = factory.createAllDirectionDeadEnd()

            expect(card.getName()).to.equal 'l1-r1-u1-d1-c0'

