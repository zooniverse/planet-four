Mark = require './mark'

class PointMark extends Mark
  type: 'point'
  x: 0
  y: 0

  constructor: ->
    super

    @set
      x: @x
      y: @y

  toJSON: ->
    {@type, @x, @y}

module.exports = PointMark
