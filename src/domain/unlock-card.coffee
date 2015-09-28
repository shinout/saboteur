

Card = require './card'
LockCard = require './lock-card'

###*
@class UnlockCard
@extends Card
@module saboteur-domain
###
class UnlockCard extends Card

    @TYPE_AXE  : LockCard.TYPE_AXE
    @TYPE_TRAM : LockCard.TYPE_TRAM
    @TYPE_LAMP : LockCard.TYPE_LAMP


    @properties:
        types: @TYPES.ARRAY


    isLocatable: no


    ###*
    @method getAutoName
    @return {String}
    ###
    getAutoName: ->

        return @types.join(',')


module.exports = UnlockCard
