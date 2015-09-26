

Card = require './card'

###*
@class RoadCard
@extends Card
@module saboteur-domain
###
class RoadCard extends Card

    ###*
    @property {Boolean} isLocatable
    ###
    isLocatable: yes

    ###*
    @property {Boolean} isDistributable
    ###
    isDistributable: yes


    ###*
    @property {Boolean} isRemovable
    ###
    isRemovable: yes



    ###*
    @property {Boolean} left
    ###
    ###*
    @property {Boolean} right
    ###
    ###*
    @property {Boolean} upper
    ###
    ###*
    @property {Boolean} lower
    ###
    ###*
    @property {Boolean} center
    ###
    constructor: (options = {}) ->

        { @left, @right, @upper, @lower, @center } = options




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


    ###*
    @method horizontallyPassable
    @return {RoadCard}
    ###
    horizontallyPassable: ->

        @center and @left and @right


    ###*
    @method verticallyPassable
    @return {Boolean}
    ###
    verticallyPassable: ->

        @center and @upper and @lower


    ###*
    @method leftUpPassible
    @return {Boolean}
    ###
    leftUpPassible: ->

        @center and @left and @upper


    ###*
    @method leftDownPassible
    @return {Boolean}
    ###
    leftDownPassible: ->

        @center and @left and @lower


module.exports = RoadCard
