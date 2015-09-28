

Card = require './card'

###*
@class LockCard
@extends Card
@module saboteur-domain
###
class LockCard extends Card

    @TYPE_AXE  : 'axe'
    @TYPE_TRAM : 'tram'
    @TYPE_LAMP : 'lamp'


    @properties:
        type: @TYPES.STRING


    isLocatable: no


    ###*
    @method getAutoName
    @return {String}
    ###
    getAutoName: ->

        return @type


module.exports = LockCard
