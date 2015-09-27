

domain = require '../domain'
Card = domain.getModel('card')

describe 'Card', ->

    describe 'getName', ->

        it 'returns @name', ->

            card = new Card(name: 'joker')

            expect(card.getName()).to.equal 'joker'

