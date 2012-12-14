Kinetic = window.Kinetic

class MarkingTool
  stage: null
  points: null

  layer: null
  circles: null
  lines: null

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @

    thrown new Error 'Marking tool needs a stage' unless @stage?
    @points ?= []

    @layer = new Kinetic.Layer
    @circles ?= []
    @lines ?= []

    @stage.add @layer

  startAt: ([x, y]) ->
    circle = new Kinetic.Circle x: x, y: y, radius: 5, fill: 'black'
    @layer.add circle
    @stage.add @layer
    console.log circle

module.exports = MarkingTool
