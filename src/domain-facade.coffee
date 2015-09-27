

Facade = require 'base-domain'

###*
@class DomainFacade
@module saboteur-domain
###
class DomainFacade extends Facade

    create: (modelName, obj = {}) ->

        @createFactory(modelName, true).createFromObject obj


module.exports = DomainFacade
