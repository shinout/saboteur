

{ ValueObject } = require '../domain-facade'


###*
@class Card
@extends ValueObject
@module saboteur-domain
###
class Card extends ValueObject


    ###*
    @property {Boolean} isLocatable
    ###
    isLocatable: no

    ###*
    @property {Boolean} isDistributable
    ###
    isDistributable: yes


    @properties:
        ###*
        @property {String} name
        ###
        name: @TYPES.STRING


    ###*
    @method getName
    @return {String}
    ###
    getName: -> @name or @getAutoName()


module.exports = Card
