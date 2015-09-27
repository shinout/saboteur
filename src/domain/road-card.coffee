

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
    @method upsideDown
    ###
    upsideDown: ->

        right  = @right
        @right = @left
        @left  = right

        lower  = @lower
        @lower = @upper
        @upper = lower


module.exports = RoadCard
