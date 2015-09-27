
{ BaseFactory } = require '../domain-facade'

RoadCard = require './road-card'

###*
@class RoadCardFactory
@extends BaseFactory
@module saboteur-domain
###
class RoadCardFactory extends BaseFactory

    @modelName: 'road-card'

    ###*
    @method createHorizontal
    @return {RoadCard}
    ###
    createHorizontal: ->

        @createFromObject(left: on, right: on, upper: off, lower: off, center: on)


    ###*
    @method createVertical
    @return {RoadCard}
    ###
    createVertical: ->

        @createFromObject(left: off, right: off, upper: on, lower: on, center: on)


    ###*
    @method createL
    @return {RoadCard}
    ###
    createL: ->

        @createFromObject(left: on, right: off, upper: off, lower: on, center: on)


    ###*
    @method createInvertL
    @return {RoadCard}
    ###
    createInvertL: ->

        @createFromObject(left: on, right: off, upper: on, lower: off, center: on)



    ###*
    @method createCross
    @return {RoadCard}
    ###
    createCross: ->

        @createFromObject(left: on, right: on, upper: on, lower: on, center: on)


    ###*
    @method createT
    @return {RoadCard}
    ###
    createT: ->

        @createFromObject(left: on, right: on, upper: on, lower: off, center: on)



    ###*
    @method createWideT
    @return {RoadCard}
    ###
    createWideT: ->

        @createFromObject(left: on, right: off, upper: on, lower: on, center: on)


    ###*
    @method createLeftDeadEnd
    @return {RoadCard}
    ###
    createLeftDeadEnd: ->

        @createFromObject(left: on, right: off, upper: off, lower: off, center: off)


    ###*
    @method createUpperDeadEnd
    @return {RoadCard}
    ###
    createUpperDeadEnd: ->

        @createFromObject(left: off, right: off, upper: on, lower: off, center: off)


    ###*
    @method createHorizontalDeadEnd
    @return {RoadCard}
    ###
    createHorizontalDeadEnd: ->

        @createFromObject(left: on, right: on, upper: off, lower: off, center: off)


    ###*
    @method createVerticalDeadEnd
    @return {RoadCard}
    ###
    createVerticalDeadEnd: ->

        @createFromObject(left: off, right: off, upper: on, lower: on, center: off)


    ###*
    @method createLFormedDeadEnd
    @return {RoadCard}
    ###
    createLFormedDeadEnd: ->

        @createFromObject(left: on, right: off, upper: off, lower: on, center: off)


    ###*
    @method createInvertedLFormedDeadEnd
    @return {RoadCard}
    ###
    createInvertedLFormedDeadEnd: ->

        @createFromObject(left: on, right: off, upper: on, lower: off, center: off)


    ###*
    @method createTFormedDeadEnd
    @return {RoadCard}
    ###
    createTFormedDeadEnd: ->

        @createFromObject(left: on, right: on, upper: on, lower: off, center: off)


    ###*
    @method createWideTFormedDeadEnd
    @return {RoadCard}
    ###
    createWideTFormedDeadEnd: ->

        @createFromObject(left: on, right: off, upper: on, lower: on, center: off)


    ###*
    @method createAllDirectionDeadEnd
    @return {RoadCard}
    ###
    createAllDirectionDeadEnd: ->

        @createFromObject(left: on, right: on, upper: on, lower: on, center: off)


module.exports = RoadCardFactory
