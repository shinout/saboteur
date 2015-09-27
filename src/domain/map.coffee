
RoadLocation  = require './road-location'
RoadLocations = require './road-locations'
GoalLocation  = require './goal-location'
StartRoadCard = require './start-road-card'

###*
@class Card
@module saboteur-domain
###
class Map


    GOAL_X        : 7
    GOAL_Y_CENTER : 0
    GOAL_Y_DELTA  : 2

    ###*
    @constructor
    @param {Array(GoalCard)} goalCards
    ###
    constructor: (goalCards) ->

        @locations = new RoadLocations()

        startRoadCard = new StartRoadCard()

        @startLocation = @locations.set(0, 0, startRoadCard)

        @goals = [
            new GoalLocation(@GOAL_ROW, @GOAL_Y_CENTER - @GOAL_Y_DELTA, goalCards[0])
            new GoalLocation(@GOAL_ROW, @GOAL_Y_CENTER, goalCards[1])
            new GoalLocation(@GOAL_ROW, @GOAL_Y_CENTER + @GOAL_Y_DELTA, goalCards[2])
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

        location = new RoadLocation(x, y, card)

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

        @locations.set(x, y, card)

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


module.exports = Map
