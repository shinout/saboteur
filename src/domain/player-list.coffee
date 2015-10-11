

{ BaseList } = require '../domain-facade'

###*
@class PlayerList
@extends BaseList
@module saboteur-domain
###
class PlayerList extends BaseList

    @itemModelName: 'player'

    ###*
    get saboteurs
    @method saboteurs
    @return {Array(Player)}
    ###
    saboteurs: ->

        Player = @itemFactory.getModelClass()

        (player for player in @items when player.role is Player.ROLE_SABOTEUR)


    ###*
    get miners
    @method miners
    @return {Array(Player)}
    ###
    miners: ->

        Player = @itemFactory.getModelClass()

        (player for player in @items when player.role is Player.ROLE_MINER)


module.exports = PlayerList
