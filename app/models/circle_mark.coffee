Mark = require './mark'

class CircleMark extends Mark
  type: 'circle'
  center: null
  radius: 0
  angle: 0

  constructor: ->
    super

    @set
      center: @center || {x: 0, y: 0}
      radius: @radius

  'set radius': (value) -> Math.max value, 15

  toJSON: ->
    {@type, @center, @radius}

module.exports = CircleMark
