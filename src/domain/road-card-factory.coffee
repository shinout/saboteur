
RoadCard = require './road-card'

###*
@class RoadCardFactory
@module saboteur-domain
###
class RoadCardFactory

    ###*
    @method createHorizontal
    @return {RoadCard}
    ###
    createHorizontal: ->

        new RoadCard(left: on, right: on, upper: off, lower: off, center: on)


    ###*
    @method createVertical
    @return {RoadCard}
    ###
    createVertical: ->

        new RoadCard(left: off, right: off, upper: on, lower: on, center: on)


    ###*
    @method createL
    @return {RoadCard}
    ###
    createL: ->

        new RoadCard(left: on, right: off, upper: off, lower: on, center: on)


    ###*
    @method createInvertL
    @return {RoadCard}
    ###
    createInvertL: ->

        new RoadCard(left: on, right: off, upper: on, lower: off, center: on)



    ###*
    @method createCross
    @return {RoadCard}
    ###
    createCross: ->

        new RoadCard(left: on, right: on, upper: on, lower: on, center: on)


    ###*
    @method createT
    @return {RoadCard}
    ###
    createT: ->

        new RoadCard(left: on, right: on, upper: on, lower: off, center: on)



    ###*
    @method createWideT
    @return {RoadCard}
    ###
    createWideT: ->

        new RoadCard(left: on, right: off, upper: on, lower: on, center: on)


    ###*
    @method createLeftDeadEnd
    @return {RoadCard}
    ###
    createLeftDeadEnd: ->

        new RoadCard(left: on, right: off, upper: off, lower: off, center: off)


    ###*
    @method createUpperDeadEnd
    @return {RoadCard}
    ###
    createUpperDeadEnd: ->

        new RoadCard(left: off, right: off, upper: on, lower: off, center: off)


    ###*
    @method createHorizontalDeadEnd
    @return {RoadCard}
    ###
    createHorizontalDeadEnd: ->

        new RoadCard(left: on, right: on, upper: off, lower: off, center: off)


    ###*
    @method createVerticalDeadEnd
    @return {RoadCard}
    ###
    createVerticalDeadEnd: ->

        new RoadCard(left: off, right: off, upper: on, lower: on, center: off)


    ###*
    @method createLFormedDeadEnd
    @return {RoadCard}
    ###
    createLFormedDeadEnd: ->

        new RoadCard(left: on, right: off, upper: off, lower: on, center: off)


    ###*
    @method createInvertedLFormedDeadEnd
    @return {RoadCard}
    ###
    createInvertedLFormedDeadEnd: ->

        new RoadCard(left: on, right: off, upper: on, lower: off, center: off)


    ###*
    @method createTFormedDeadEnd
    @return {RoadCard}
    ###
    createTFormedDeadEnd: ->

        new RoadCard(left: on, right: on, upper: on, lower: off, center: off)


    ###*
    @method createWideTFormedDeadEnd
    @return {RoadCard}
    ###
    createWideTFormedDeadEnd: ->

        new RoadCard(left: on, right: off, upper: on, lower: on, center: off)


    ###*
    @method createAllDirectionDeadEnd
    @return {RoadCard}
    ###
    createAllDirectionDeadEnd: ->

        new RoadCard(left: on, right: on, upper: on, lower: on, center: off)


module.exports = RoadCardFactory
