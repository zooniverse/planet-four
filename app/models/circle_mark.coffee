Mark = require './mark'

class CircleMark extends Mark
  source: null
  radius: NaN
  angle: NaN

  constructor: ->
    super
    @source ?= [0, 0]
    @radius ?= 0
    @angle ?= 0

module.exports = CircleMark
