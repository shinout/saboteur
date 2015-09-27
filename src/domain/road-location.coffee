
Location = require './location'

###*
@class RoadLocation
@extends Location
@module saboteur-domain
###
class RoadLocation extends Location

    ###*
    @property {Number} x
    ###
    ###*
    @property {Number} y
    ###
    ###*
    @property {RoadCard} roadCard
    ###
    constructor: (@x, @y, @roadCard) ->


module.exports = RoadLocation
