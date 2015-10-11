

{ Entity } = require '../domain-facade'

###*
@class Player
@extends Entity
@module saboteur-domain
###
class Player extends Entity

    @ROLE_MINER    : 'miner'
    @ROLE_SABOTEUR : 'saboteur'

    @properties:
        ###*
        @property {String} name
        ###
        name: @TYPES.STRING

        ###*
        @property {CardList} hands
        ###
        hands: @TYPES.MODEL_LIST 'card'


        ###*
        @property {LockCardDict} locks
        ###
        locks: @TYPES.MODEL_DICT 'lock-card'


        ###*
        @property {String} role
        ###
        role: @TYPES.STRING


    ###*
    @method pickCard
    @param {Number} index
    ###
    pickCard: (index) ->

        card = @hands.use index

        return card


    ###*
    @method addCard
    @param {Card} card
    ###
    addCard: (card) ->

        @hands.add card


    ###*
    @method lock
    @param {LockCard} lockCard
    ###
    lock: (lockCard) ->

        @locks.lock lockCard


    ###*
    @method canBeLocked
    @param {LockCard} lockCard
    @return {Boolean}
    ###
    canBeLocked: (lockCard) ->

        lockCard.type not in @locks.lockedTypes()



    ###*
    @method canBeUnlocked
    @param {UnlockCard} unlockCard
    @return {Boolean}
    ###
    canBeUnlocked: (unlockCard) ->

        unlockCard.types.some (type) => type in @locks.lockedTypes()



    ###*
    @method unlock
    @param {UnlockCard} unlockCard
    ###
    unlock: (unlockCard) ->

        @locks.unlock unlockCard


    ###*
    @method hasNoCard
    @return {Boolean}
    ###
    hasNoCard: ->

        @hands.length is 0


module.exports = Player
