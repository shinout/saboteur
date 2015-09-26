

RoadCard = require './road-card'

###*
@class StartRoadCard
@extends RoadCard
@module saboteur-domain
###
class StartRoadCard extends RoadCard

    constructor: ->
        @left   = on
        @right  = on
        @upper  = on
        @lower  = on
        @center = on

        @isLocatable     = yes
        @isDistributable = no
        @isRemovable     = no


module.exports = StartRoadCard
