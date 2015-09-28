

{ BaseList } = require '../domain-facade'

###*
@class CardList
@extends BaseList
@module saboteur-domain
###
class CardList extends BaseList

    @itemModelName: 'card'

    ###*
    use a card. removes it from items
    @method use
    @param {Number} index
    @return {Card}
    ###
    use: (index) ->

        card = @items[index]

        @remove index

        return card


    ###*
    draw a card
    @method draw
    @return {Card}
    ###
    draw: ->
        if not @length
            throw new Error 'noCard'

        return @items.pop()



module.exports = CardList
