
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
    getByXY: (x, y) ->

        key = @itemFactory.createFromObject(x: x, y: y).toString()

        @get(key)


    ###*
    @method getCard
    @param {Number} x
    @param {Number} y
    @return {RoadCard} roadCard
    ###
    getCard: (x, y) ->

        @getByXY(x, y)?.roadCard


    ###*
    @method getConnectedNeighbors
    @param {RoadLocation} location
    @param {Array(RoadLocation)} array of connected locations
    ###
    getConnectedNeighbors: (location) ->

        connectedLocations = []

        if upper = @getByXY(location.x, location.y + 1)
            connectedLocations.push upper if @isVerticallyConnected(upper, location)


        if lower = @getByXY(location.x, location.y - 1)
            connectedLocations.push lower if @isVerticallyConnected(location, lower)


        if left = @getByXY(location.x - 1, location.y)
            connectedLocations.push left if @isHorizontallyConnected(left, location)


        if right = @getByXY(location.x + 1, location.y)
            connectedLocations.push right if @isHorizontallyConnected(location, right)


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

        { x, y, roadCard } = location

        if leftCard = @getCard(x - 1, y)
            return no if leftCard.right is on and roadCard.left is off
            return no if leftCard.right is off and roadCard.left is on

        if rightCard = @getCard(x + 1, y)
            return no if rightCard.left is on and roadCard.right is off
            return no if rightCard.left is off and roadCard.right is on

        if upperCard = @getCard(x, y + 1)
            return no if upperCard.lower is on and roadCard.upper is off
            return no if upperCard.lower is off and roadCard.upper is on

        if lowerCard = @getCard(x, y - 1)
            return no if lowerCard.upper is on and roadCard.lower is off
            return no if lowerCard.upper is off and roadCard.lower is on

        return yes


module.exports = RoadLocationDict
