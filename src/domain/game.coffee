
{ Entity } = require '../domain-facade'

###*
@class Player
@extends Entity
@module saboteur-domain
###
class Game extends Entity

    @properties:
        players   : @TYPES.MODEL_LIST 'player'
        saboteurs : @TYPES.NUMBER
        miners    : @TYPES.NUMBER


    addPlayer: (player) ->

        @players.add player

        index = @players.length - 1

        return index


    removePlayer: (index) ->

        @players.remove index


    start: ->

        return @getFacade().createService('game', @)


module.exports = Game
