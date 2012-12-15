Mark = require './mark'

class FanMark extends Mark
  source: null
  distance: NaN
  angle: NaN
  spread: NaN

  constructor: ->
    super
    @source ?= [0, 0]
    @distance ?= 0
    @angle ?= 0
    @spread ?= 0

module.exports = FanMark
