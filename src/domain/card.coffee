

{ ValueObject } = require '../domain-facade'


###*
@class Card
@extends ValueObject
@module saboteur-domain
###
class Card extends ValueObject


    @properties:
        ###*
        @property {String} name
        ###
        name: @TYPES.STRING

        ###*
        @property {Boolean} isLocatable
        ###
        isLocatable: @TYPES.BOOLEAN

        ###*
        @property {Boolean} isDistributable
        ###
        isDistributable: @TYPES.BOOLEAN


    ###*
    @method getName
    @return {String}
    ###
    getName: -> @name or @getAutoName()


module.exports = Card
