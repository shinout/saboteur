

Card = require './card'

###*
@class GoalCard
@extends Card
@module saboteur-domain
###
class GoalCard extends Card

    ###*
    @property {Boolean} isDistributable
    ###
    isDistributable: no


    @properties: @withParentProps

        ###*
        @property {Boolean} isGenuineGoal
        ###
        isGenuineGoal: @TYPES.BOOLEAN

        ###*
        @property {Boolean} left
        ###
        left: @TYPES.BOOLEAN

        ###*
        @property {Boolean} right
        ###
        right: @TYPES.BOOLEAN

        ###*
        @property {Boolean} upper
        ###
        upper: @TYPES.BOOLEAN

        ###*
        @property {Boolean} lower
        ###
        lower: @TYPES.BOOLEAN



    ###*
    @method flip
    @return {RoadCard} card
    ###
    flip: ->

        card = @getFacade().createModel 'road-card',
            left   : @left
            right  : @right
            upper  : @upper
            lower  : @lower
            center : on

        card.isRemovable = no

        return card

module.exports = GoalCard
