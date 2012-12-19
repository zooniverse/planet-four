Mark = require './mark'

class FanMark extends Mark
  source: null
  distance: 0
  angle: 0
  spread: 0

  constructor: ->
    super
    @source ?= [0, 0]

  'set distance': (value) -> Math.max value, 15

  'set spread': (value) -> Math.max value, 10

module.exports = FanMark
