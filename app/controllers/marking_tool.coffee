Mark = require 'models/mark'
{Module, Events} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class MarkingTool extends Module
  @extend Events
  @include Events

  @mark: Mark

  mark: null
  stage: null

  events: null

  cursors: null

  layer: null

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @
    throw new Error 'Marking tool needs a stage' unless @stage?

    @mark ?= new @constructor.mark params
    @mark.bind 'change', @render
    @mark.bind 'destroy', @remove

    @layer = new Kinetic.Layer
    @stage.add @layer

    # Methods named "on <event-type> <shape-name (optional)>" will be
    # automatically handled. "Drag" is special and handled on mouse down.
    # TODO: Handle touch events.
    @layer.on 'mousedown mousemove mouseup click', @handleLayerEvent

    if @cursors?
      body = $(document.body)

      @stage.on 'mouseover', ({shape}) =>
        cursor = @cursors[shape.getName()]
        return unless cursor?

        body.css {cursor}

        if cursor is 'move'
          body.on 'mousedown.move', => body.css cursor: '-moz-grabbing' # TODO
          body.on 'mouseup.move', => body.css cursor: 'move'

      @stage.on 'mouseout', =>
        body.css cursor: ''
        body.off '.move'

    # Create dots and lines or whatever.

  onFirstClick: ([x, y]) ->
    # Modify the mark.

  onFirstDrag: ([x, y]) ->
    # Modify the mark.

  handleLayerEvent: (e) =>
    name = e.shape.getName()
    return unless name

    @["on #{e.type}"]? e

    @["on #{e.type} #{name}"]? e

    if e.type is 'mousedown'
      onDrag = @["on drag #{name}"]

      if typeof onDrag is 'function'
        doc = $(document)
        doc.on 'mousemove', onDrag
        doc.one 'mouseup', =>
          doc.off 'mousemove', onDrag

  render: =>
    # Draw dots and lines or whatever.
    @layer.draw()

  select: ->
    @layer.setOpacity 1
    @trigger 'select'
    @layer.moveToTop()
    @layer.draw()

  deselect: ->
    @layer.setOpacity 0.5
    @trigger 'deselect'
    @layer.draw()

  remove: =>
    @trigger 'remove'
    @layer.off 'mousedown mousemove mouseup click'
    @layer.remove()

  isComplete: ->
    true

  mouseOffset: (e) ->
    {left, top} = $(@stage.getContainer()).offset()
    x: e.pageX - left
    y: e.pageY - top

  createTarget: (shape) ->
    group = new Kinetic.Group
    target = new Kinetic.Circle $.extend {name: shape.getName(), radius: shape.getRadius() + 5}, style.target
    group.add target
    group.add shape
    group

module.exports = MarkingTool
