

RoadCard = require './road-card'

###*
@class StartRoadCard
@extends RoadCard
@module saboteur-domain
###
class StartRoadCard extends RoadCard

    isLocatable: yes

    isDistributable: no

    isRemovable: no

    constructor: ->
        @left   = on
        @right  = on
        @upper  = on
        @lower  = on
        @center = on


module.exports = StartRoadCard
