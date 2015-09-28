
{ BaseDict } = require '../domain-facade'

###*
@class LockCardDict
@extends BaseDict
@module saboteur-domain
###
class LockCardDict extends BaseDict

    @itemModelName: 'lock-card'


    @key: (lockCard) -> lockCard.type


    ###*
    @method unlock
    @param {UnlockCard} unlockCard
    ###
    lock: (lockCard) ->

        if @has(lockCard.type)
            throw new Error 'alreadyLockedBySameType'

        @add(lockCard)



    ###*
    unlock
    @method unlock
    @param {UnlockCard} unlockCard
    ###
    unlock: (unlockCard) ->

        locked = unlockCard.types.some (type) => @has(type)

        if locked
            @remove(type) for type in unlockCard.types

        else
            throw new Error 'notLockedByGivenTypes'


    ###*
    get locked types
    @method lockedTypes
    @return {Array(String)} lockedTypes
    ###
    lockedTypes: ->

        @Object.keys @items



module.exports = LockCardDict
