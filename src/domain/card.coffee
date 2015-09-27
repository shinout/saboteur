

{ ValueObject } = require '../domain-facade'


###*
@class Card
@extends ValueObject
@module saboteur-domain
###
class Card extends ValueObject


    @properties:
        ###*
        @property {Boolean} isLocatable
        ###
        isLocatable: @TYPES.BOOLEAN

        ###*
        @property {Boolean} isDistributable
        ###
        isDistributable: @TYPES.BOOLEAN



module.exports = Card
