Mark = require 'models/mark'
{Module, Events} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

doc = $(document)

class MarkingTool extends Module
  @extend Events
  @include Events

  @mark: Mark

  mark: null
  stage: null

  events: null

  cursors: null

  targetMin: 15

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
    @layer.on 'mousedown touchstart', @handleLayerEvent

    if @cursors?
      body = $(document.body)

      @layer.on 'mouseover', ({shape}) =>
        cursor = @cursors[shape.getName()]
        return unless cursor?

        body.css {cursor}

        if cursor is 'move'
          body.on 'mousedown.move', => body.css cursor: '-moz-grabbing' # TODO
          body.on 'mouseup.move', => body.css cursor: 'move'

      @layer.on 'mouseout', =>
        body.css cursor: ''
        body.off '.move'

    # Create dots and lines or whatever.

  onFirstClick: ([x, y]) ->
    # Modify the mark.

  onFirstDrag: ([x, y]) ->
    # Modify the mark.

  handleLayerEvent: (e) =>
    type = e.type
    name = e.shape?.getName()

    # TODO: Probably not this.
    type = switch
      when 'touchstart' then 'mousedown'
      when 'touchmove' then 'mousemove'
      when 'touchend' then 'mouseup'
      else type

    @["on #{type}"]? e

    return unless name

    @["on #{type} #{name}"]? e

    if type in ['mousedown', 'touchstart']
      onDrag = @["on drag #{name}"]

      if typeof onDrag is 'function'
        e.preventDefault()

        doc.on 'mousemove touchmove', onDrag
        doc.one 'mouseup touchend', =>
          doc.off 'mousemove touchmove', onDrag

  'on mousedown': (e) ->
    e.stopPropagation() # TODO: Prevent default instead (broke on touch?).
    @select()

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
    e = e.originalEvent if 'originalEvent' of e
    e = e.touches[0] if 'touches' of e
    {left, top} = $(@stage.getContainer()).offset()
    x: e.pageX - left
    y: e.pageY - top

  createTarget: (shape) ->
    naturalTarget = shape.getRadius() + 5
    group = new Kinetic.Group
    target = new Kinetic.Circle $.extend {name: shape.getName(), radius: Math.max @targetMin, naturalTarget}, style.target
    group.add target
    group.add shape
    group

module.exports = MarkingTool
