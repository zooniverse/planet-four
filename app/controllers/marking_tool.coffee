Mark = require 'models/mark'
Kinetic = window.Kinetic

class MarkingTool
  @mark: Mark

  mark: null
  stage: null

  layer: null

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @
    throw new Error 'Marking tool needs a stage' unless @stage?

    @mark ?= new @constructor.mark params
    @mark.bind 'change', @render

    @layer = new Kinetic.Layer
    @stage.add @layer

    # Create dots and lines or whatever.

  onFirstClick: ([x, y]) ->
    # Modify the mark.

  onFirstDrag: ([x, y]) ->
    # Modify the mark.

  render: =>
    # Draw dots and lines or whatever.
    @layer.draw()

  isComplete: ->
    true

module.exports = MarkingTool
