
Matrix = require './matrix'

###*
@class Card
@module saboteur-domain
###
class Map

    @VERTICAL_SIZE   : 31
    @HORIZONTAL_SIZE : 51

    # @VERTICAL_CENTER   : 16
    # @HORIZONTAL_CENTER : 26

    constructor: ->

        @pos   = new Matrix()
        @goals = new Matrix()


    ###*
    @method isLocatable
    @param {RoadCard} card
    @param {Number} hPos horizontal position
    @param {Number} vPos vertical position
    @return {Boolean}
    ###
    isLocatable: (card, hPos, vPos) ->

        return no if card.isLocatable

        hasNeighborCard = no

        if leftCard = @pos.get(hPos - 1, vPos)
            hasNeighborCard = yes
            return no if leftCard.right is on and card.left is off
            return no if leftCard.right is off and card.left is on

        if rightCard = @pos.get(hPos + 1, vPos)
            hasNeighborCard = yes
            return no if rightCard.left is on or card.right is off
            return no if rightCard.left is off or card.right is on

        if upperCard = @pos.get(hPos, vPos - 1)
            hasNeighborCard = yes
            return no if upperCard.lower is on or card.upper is off
            return no if upperCard.lower is off or card.upper is on

        if lowerCard = @pos.get(hPos, vPos + 1)
            hasNeighborCard = yes
            return no if lowerCard.upper is on or card.loewr is off
            return no if lowerCard.upper is off or card.lower is on


        return hasNeighborCard


    ###*
    @method locateCardTo
    @param {RoadCard} card
    @param {Number} hPos horizontal position
    @param {Number} vPos vertical position
    ###
    locateCardTo: (card, hPos, vPos) ->

        if @isLocatable(card, hPos, vPos)

            @pos.set(hPos, vPos, card)

        else
            card.upsideDown()

            if @isLocatable(card, hPos, vPos)

                @pos.set(hPos, vPos, card)


    ###*
    @method remove
    @param {Number} hPos horizontal position
    @param {Number} vPos vertical position
    ###
    remove: (hPos, vPos) ->

        card = @pos.get hPos, vPos

        if card.isRemovable

            @pos.remove hPos, vPos


module.exports = Map
