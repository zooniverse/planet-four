Mark = require './mark'

class CircleMark extends Mark
  source: null
  radius: 0
  angle: 0

  constructor: ->
    super

    @set
      source: @source || [0, 0]
      radius: @radius


  'set radius': (value) -> Math.max value, 15

module.exports = CircleMark
