

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


module.exports = GoalLocation
