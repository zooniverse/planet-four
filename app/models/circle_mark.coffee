Mark = require './mark'

class CircleMark extends Mark
  source: null
  radius: 0
  angle: 0

  constructor: ->
    super
    @source ?= [0, 0]

  'set radius': (value) -> Math.max value, 15

module.exports = CircleMark
