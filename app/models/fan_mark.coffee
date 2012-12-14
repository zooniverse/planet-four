Mark = require './mark'

class FanMark extends Mark
  source: null
  distance: NaN
  angle: NaN
  spread: NaN

  constructor: ->
    super
    @source ?= [0.5, 0.8]
    @distance ?= 0.5
    @angle ?= 0
    @spread ?= 0

module.exports = FanMark
