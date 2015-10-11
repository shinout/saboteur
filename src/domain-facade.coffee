

Facade = require 'base-domain'

###*
@class DomainFacade
@module saboteur-domain
###
class DomainFacade extends Facade

    createModel: (modelName, obj = {}) ->

        @createFactory(modelName, true).createFromObject obj


    createDict: (modelName, items = []) ->

        @createFactory(modelName, true).createDict modelName + '-dict', items

    getService: (name) ->

        @require("#{name}-service")


module.exports = DomainFacade
