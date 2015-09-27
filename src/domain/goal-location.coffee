

Location = require './location'

###*
@class GoalLocation
@extends Location
@module saboteur-domain
###
class GoalLocation extends Location

    @properties: @withParentProps
        ###*
        @property {RoadCard} goalCard
        ###
        goalCard: @TYPES.MODEL 'goal-card'


    ###*
    @method isNeighbor
    @param {Number} x
    @param {Number} y
    @return {Boolean}
    ###
    isNeighbor: (x, y) ->
        { abs } = Math

        abs(@x - x) + abs(@y - y) is 1

module.exports = GoalLocation
