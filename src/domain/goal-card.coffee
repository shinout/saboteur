

Card = require './card'

###*
@class GoalCard
@extends Card
@module saboteur-domain
###
class GoalCard extends Card

    isLocatable: no

    isDistributable: no


    ###*
    @property {Boolean} isGenuineGoal
    ###
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
    constructor: (@isGenuineGoal, @left, @right, @upper, @lower) ->


    ###*
    @method flip
    @return {RoadCard} card
    ###
    flip: ->

        card = new RoadCard(
            left   : @left
            right  : @right
            upper  : @upper
            lower  : @lower
            center : on
        )

        card.isRemovable = no

        return card

module.exports = GoalCard
