Mark = require './mark'

class FanMark extends Mark
  source: null
  distance: 0
  angle: 0
  spread: 0

  constructor: ->
    super

    @set
      source: @source || [0, 0]
      distance: @distance
      angle: @angle
      spread: @spread

  'set distance': (value) -> Math.max value, 10

  'set spread': (value) -> Math.min 90, Math.max 1, value

module.exports = FanMark
