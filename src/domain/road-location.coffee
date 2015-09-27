
Location = require './location'

###*
@class RoadLocation
@extends Location
@module saboteur-domain
###
class RoadLocation extends Location

    @properties: @withParentProps

        ###*
        @property {RoadCard} roadCard
        ###
        roadCard: @TYPES.MODEL 'road-card'


module.exports = RoadLocation
