
{ ValueObject } = require '../domain-facade'

###*
@class Location
@extends ValueObject
@module saboteur-domain
###
class Location extends ValueObject

    @properties:
        ###*
        @property {Number} x
        ###
        x: @TYPES.NUMBER

        ###*
        @property {Number} y
        ###
        y: @TYPES.NUMBER



    ###*
    @method toString
    @return {String}
    ###
    toString: -> @x + ',' + @y


    ###*
    @method is
    @param {Number} x
    @param {Number} y
    @return {Boolean}
    ###
    is: (x, y) ->

        @x is x and @y is y



    ###*
    @method isNeighbor
    @param {Number} x
    @param {Number} y
    @return {Boolean}
    ###
    isNeighbor: (x, y) ->
        { abs } = Math

        abs(@x - x) + abs(@y - y) is 1


module.exports = Location
