
###*
@class Location
@module saboteur-domain
###
class Location

    ###*
    @property {Number} x
    ###
    ###*
    @property {Number} y
    ###
    constructor: (@x, @y) ->


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




module.exports = Location
