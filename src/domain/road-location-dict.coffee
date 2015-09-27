
{ BaseDict } = require '../domain-facade'

###*
@class RoadLocationDict
@extends BaseDict
@module saboteur-domain
###
class RoadLocationDict extends BaseDict

    @itemModelName: 'road-location'


    @key: (location) -> location.toString()


    ###*
    @method get
    @param {Number} x
    @param {Number} y
    @return {RoadLocation} location
    ###
    get: (x, y) ->

        @items[new Location(x, y).toString()]


    ###*
    @method getCard
    @param {Number} x
    @param {Number} y
    @return {RoadCard} roadCard
    ###
    getCard: (x, y) ->

        @get(x, y)?.roadCard


    ###*
    @method getConnectedNeighbors
    @param {RoadLocation} location
    @param {Array(RoadLocation)} array of connected locations
    ###
    getConnectedNeighbors: (location) ->

        connectedLocations = []

        if right = @get(location.x + 1, location.y)
            connectedLocations.push right if @isHorizontallyConnected(location, right)


        if upper = @get(location.x, location.y - 1)
            connectedLocations.push upper if @isVerticallyConnected(upper, location)


        if lower = @get(location.x, location.y + 1)
            connectedLocations.push lower if @isVerticallyConnected(location, lower)


        if left = @get(location.x - 1, location.y)
            connectedLocations.push left if @isHorizontallyConnected(left, location)


        return connectedLocations


    ###*
    @method isHorizontallyConnected
    @param {RoadLocation} left
    @param {RoadLocation} right
    @return {Boolean}
    ###
    isHorizontallyConnected: (left, right) ->

        left.roadCard.right and right.roadCard.left


    ###*
    @method isVerticallyConnected
    @param {RoadLocation} upper
    @param {RoadLocation} lower
    @return {Boolean}
    ###
    isVerticallyConnected: (upper, lower) ->

        upper.roadCard.lower and lower.roadCard.upper


    ###*
    @method isConnectedToNeighbors
    @param {RoadLocation} upper
    @param {RoadLocation} lower
    @return {Boolean}
    ###
    isConnectedToNeighbors: (location) ->

        @getConnectedNeighbors(location).length > 0


    ###*
    @method isCompatible
    @param {GoalLocation} location
    @return {Boolean}
    ###
    isCompatible: (location) ->

        return no if not @isConnectedToNeighbors(location)

        if leftCard = @locations.getCard(x - 1, y)
            return no if leftCard.right is on and card.left is off
            return no if leftCard.right is off and card.left is on

        if rightCard = @locations.getCard(x + 1, y)
            return no if rightCard.left is on or card.right is off
            return no if rightCard.left is off or card.right is on

        if upperCard = @locations.getCard(x, y - 1)
            return no if upperCard.lower is on or card.upper is off
            return no if upperCard.lower is off or card.upper is on

        if lowerCard = @locations.getCard(x, y + 1)
            return no if lowerCard.upper is on or card.loewr is off
            return no if lowerCard.upper is off or card.lower is on

        return yes


module.exports = RoadLocationDict
