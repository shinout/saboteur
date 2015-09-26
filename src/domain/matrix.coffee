
class Matrix

    constructor: (vsize, hsize) ->

        @values = {}

    keyName: (vpos, hpos) ->
        return vpos + '-' + hpos

    get: (vpos, hpos) ->

        @values[@keyName vpos, hpos]


    set: (vpos, hpos, val) ->

        @values[@keyName vpos, hpos] = val


    remove: (vpos, hpos) ->

        delete @values[@keyName vpos, hpos]


module.exports = Matrix
