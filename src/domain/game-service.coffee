
{ Base } = require '../domain-facade'


###*
@class GameService
@extends Base
@module saboteur-domain
###
class GameService extends Base

    ###*
    @constructor
    @param {Array(GoalCard)} goalCards
    ###
    constructor: (@players) ->

        facade = @getFacade()

        @talon = facade.createList('card')

        @grave = facade.createList('card')

        @goals = []

        @map = facade.createService('map', @goals)

        @currentIndex = 0



    ###*
    get current player
    @method currentPlayer
    @return {Player}
    ###
    currentPlayer: ->

        @players[@currentIndex]



    ###*
    end the current turn and go to the next
    @method turnEnd
    @param {Card} usedCard
    @return {Boolean} isGameEnd
    ###
    turnEnd: (usedCard) ->

        @grave.add usedCard

        if @talon.length
            newCard = talon.draw()
            @currentPlayer().addCard newCard

        @currentIndex = (@currentIndex + 1) % @players.length

        return @isGameEnd()



    ###*
    return if game is end due to no cards exist in any players or talon
    @method isGameEnd
    @private
    @return {Boolean} isGameEnd
    ###
    isGameEnd: ->

        @talon.length is 0 and @players.every (player) -> player.hasNoCard()



    ###*
    discard a card in the current player's hands
    @method discard
    @param {Card} card
    @return {Boolean} isGameEnd
    ###
    discard: (card) ->

        @turnEnd(card)


    ###*
    locate a road card to x, y

    @method locateRoad
    @param {RoadCard} roadCard
    @param {Number} x
    @param {Number} y
    @return {Boolean} isGameEnd
    ###
    locateRoad: (roadCard, x, y) ->

        @map.locateCardTo roadCard, x, y

        @turnEnd(roadCard)


    ###*
    lock target player with the lockCard

    @method lock
    @param {LockCard} lockCard
    @param {Player} target
    @return {Boolean} isGameEnd
    ###
    lock: (lockCard, target) ->

        target.lock(lockCard)

        @turnEnd(lockCard)



    ###*
    unlock target player with the unlockCard

    @method unlock
    @param {UnlockCard} unlockCard
    @param {Player} target
    @return {Boolean} isGameEnd
    ###
    unlock: (unlockCard, target) ->

        target.unlock(unlockCard)

        @turnEnd(lockCard)



    ###*
    destroy target location

    @method destroy
    @param {DestructionCard} dsCard
    @param {Number} x
    @param {Number} y
    @return {Boolean} isGameEnd
    ###
    destroy: (dsCard, x, y) ->

        @map.remove(x, y)

        @turnEnd(lockCard)


    ###*
    @method treasureMap
    @param {TreasureMapCard} treasureMapCard
    @return {Boolean} isGameEnd
    ###
    treasureMap: (treasureMapCard) ->

        @turnEnd(treasureMapCard)



module.exports = GameService
