Mark = require './mark'

class FanMark extends Mark
  type: 'fan'
  source: null
  distance: 0
  angle: 0
  spread: 0
  version: 2

  constructor: ->
    super

    @set
      source: @source || {x: 0, y: 0}
      distance: @distance
      angle: @angle
      spread: @spread

  'set distance': (value) -> Math.max value, 10

  'set spread': (value) -> Math.min 179.99, Math.max 1, value

  toJSON: ->
    {@type, @source, @distance, @angle, @spread, @version}

module.exports = FanMark
