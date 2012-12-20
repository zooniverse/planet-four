Mark = require './mark'

class EllipseMark extends Mark
  type: 'ellipse'
  center: null
  radius1: 0
  radius2: 0
  angle: 0

  constructor: ->
    super

    @set
      center: @center || [0, 0]
      radius: @radius
      radius1: @radius1
      radius2: @radius2
      angle: @angle

  'set radius1': (value) -> Math.max value, 10

  'set radius2': (value) -> Math.max value, 10

  toJSON: ->
    {@type, @center, @radius1, @radius2, @angle}

module.exports = EllipseMark
