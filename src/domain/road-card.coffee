

Card = require './card'

###*
@class RoadCard
@extends Card
@module saboteur-domain
###
class RoadCard extends Card

    @properties: @withParentProps

        ###*
        @property {Boolean} isRemovable
        ###
        isRemovable: @TYPES.BOOLEAN


    constructor: ->

        super

        @isRemovable = yes


    ###*
    @method getAutoName
    @return {String}
    ###
    getAutoName: ->

        numStr = (prefix, bool) -> prefix + if bool then '1' else '0'

        return [
            numStr 'l', @left
            numStr 'r', @right
            numStr 'u', @upper
            numStr 'd', @lower
            numStr 'c', @center
        ].join('-')



    ###*
    @method upsideDown
    ###
    upsideDown: ->

        right  = @right
        @right = @left
        @left  = right

        lower  = @lower
        @lower = @upper
        @upper = lower

        return @


module.exports = RoadCard
