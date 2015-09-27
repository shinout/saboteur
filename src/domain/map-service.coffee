
{ Base } = require '../domain-facade'


###*
@class MapService
@extends Base
@module saboteur-domain
###
class MapService extends Base

    GOAL_X        : 8
    GOAL_Y_CENTER : 0
    GOAL_Y_DELTA  : 2

    ###*
    @constructor
    @param {Array(GoalCard)} goalCards
    ###
    constructor: (goalCards) ->

        facade = @getFacade()

        @locations = facade.create('road-location')

        startRoadCard = facade.create('start-road-card')

        @startLocation = facade.create('road-location', x: 0, y: 0, roadCard: startRoadCard)

        @locations.add @startLocation

        @goals = [
            facade.create('goal-location', x: @GOAL_X, y: @GOAL_Y_CENTER - @GOAL_Y_DELTA, goalCard: goalCards[0])
            facade.create('goal-location', x: @GOAL_X, y: @GOAL_Y_CENTER, goalCard: goalCards[0])
            facade.create('goal-location', x: @GOAL_X, y: @GOAL_Y_CENTER + @GOAL_Y_DELTA, goalCard: goalCards[0])
        ]


    ###*
    (depth-first-search)

    @method isReachable
    @return {Boolean}
    ###
    isReachable: (x, y) ->

        locationStack = [@startLocation]
        visited = {}
        visited[@startLocation] = true

        while locationStack.length

            location = locationStack.pop()

            if location.is(x, y)
                return true

            continue if not location.roadCard.center

            for nextLocation in @locations.getConnectedNeighbors(location) when not visited[nextLocation]

                visited[nextLocation] = true
                locationStack.push nextLocation

        return false



    ###*
    @method isLocatable
    @param {RoadCard} card
    @param {Number} x horizontal position
    @param {Number} y vertical position
    @param {Object} [options={}]
    @param {Boolean} options.allowIncompatible
    @return {Boolean}
    ###
    isLocatable: (card, x, y, options = {}) ->

        return no if card.isLocatable

        location = @getFacade().create 'road-location', x: x, y: y, roadCard: card

        if options.allowIncompatible

            return @locations.isConnectedToNeighbors(location)

        else
            return @locations.isCompatible(location)


    ###*
    @method locateCardTo
    @param {RoadCard} card
    @param {Number} x horizontal position
    @param {Number} y vertical position
    @param {Object} [options={}]
    @param {Boolean} options.allowIncompatible
    @return {Array(GoalLocation)} goalLocations reached goals
    ###
    locateCardTo: (card, x, y, options) ->

        if not @isLocatable(card, x, y, options)
            throw new Error 'cannotLocate'

        location = facade.create('road-location', x: x, y: y, roadCard: card)

        @locations.add location

        (goalLocation for goalLocation, i in @goals when goalLocation.isNeighbor(x, y))


    ###*
    @method flipGoal
    @param {GoalLocation} goalLocation
    @return {Boolean} isGenuineGoal
    ###
    flipGoal: (goalLocation) ->

        { goalCard } = goalLocation

        newCard = goalCard.flip()

        if not @isLocatable(newCard, goalLocation.x, goalLocation.y, allowIncompatible: true)
            throw new Error('cannotFlip')

        return goodCard.isGenuineGoal


    ###*
    @method remove
    @param {Number} x horizontal position
    @param {Number} y vertical position
    ###
    remove: (x, y) ->

        card = @locations.getCard x, y

        if card.isRemovable

            @locations.remove x, y


module.exports = MapService
