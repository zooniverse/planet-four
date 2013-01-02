Mark = require 'models/mark'
{Module, Events} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

doc = $(document)
body = $(document.body)

class MarkingTool extends Module
  @extend Events
  @include Events

  @mark: Mark

  mark: null
  stage: null
  group: null
  shape: null
  deleteButton: null
  targetMin: if 'Touch' of window then 22 else 10

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

    @deleteButton = $('<span class="delete-button">&times</span>')
    @deleteButton.css position: 'absolute'
    @deleteButton.on 'click', @onClickDeleteButton
    @deleteButton.appendTo @stage.getContainer()

    # Methods named "on <event-type> <shape-name (optional)>" will be
    # automatically handled. "Drag" is special and handled on mouse down.
    @layer.on 'mousedown touchstart', @handleLayerEvent

    if @cursors?
      @layer.on 'mousemove', ({shape}) =>
        cursor = @cursors[shape.getName()] || ''
        body.css {cursor}

      @layer.on 'mouseout', =>
        body.css cursor: ''

    # Then create dots and lines or whatever.

  onFirstClick: (e) ->
    # Modify the mark.
    @trigger 'first-click'

  onFirstDrag: (e) ->
    # Modify the mark.
    doc.one 'mouseup touchend', =>
      @trigger 'first-drag'

  handleLayerEvent: (e) =>
    type = e.type
    name = e.shape?.getName()

    # TODO: Probably not this.
    type = switch
      when 'touchstart' then 'mousedown'
      when 'touchmove' then 'mousemove'
      when 'touchend' then 'mouseup'
      else type

    @["on #{type}"]?.call @, arguments...
    @["on #{type} #{name}"]?.call @, arguments...

    if type in ['mousedown', 'touchstart']
      onDrag = @["on drag"]
      onNamedDrag = @["on drag #{name}"]

      if typeof onDrag is 'function'
        dragAttached = true
        doc.on 'mousemove.drag touchmove.drag', => onDrag.call @, arguments...

      if name and typeof onNamedDrag is 'function'
        dragAttached = true
        doc.on 'mousemove.drag touchmove.drag', => onNamedDrag.call @, arguments...

      if dragAttached
        doc.one 'mouseup touchend', => doc.off '.drag'

  'on mousedown': (e) ->
    e.stopPropagation() # TODO: Prevent default instead (broke on touch?).
    @select()

  mouseDownPos: null
  handleDrag: (e, property) =>
    {x, y} = @mouseOffset e

    if @mouseDownPos
      x = @mouseDownPos.x + x
      y = @mouseDownPos.y + y

      @mark.set property, {x, y}

    else
      @mouseDownPos =
        x: (@mark[property].x || @mark[property][0]) - x
        y: (@mark[property].y || @mark[property][1]) - y

      $(document).one 'mouseup touchend', =>
        @mouseDownPos = null

  onClickDeleteButton: (e) =>
    @mark.destroy()

  render: =>
    # Draw dots and lines or whatever.
    @layer.draw()

  select: ->
    @layer.setOpacity 1
    @deleteButton.show()
    @trigger 'select'
    @layer.moveToTop()
    @layer.draw()

  deselect: ->
    @layer.setOpacity 0.5
    @deleteButton.hide()
    @trigger 'deselect'
    @layer.draw()

  remove: =>
    (@group || @shape).transitionTo
      duration: 0.25
      easing: 'ease-out'
      opacity: 0
      scale: x: 0.001, y: 0.001
      x: parseFloat @deleteButton.css 'left'
      y: parseFloat @deleteButton.css 'top'
      callback: =>
        @trigger 'remove'
        @layer.off 'mousedown mousemove mouseup click'
        @layer.remove()
        @deleteButton.off().fadeOut 'fast', => @deleteButton.remove()

  isComplete: ->
    true

  trigger: (eventName, etc...) ->
    Events.trigger.call @, arguments...
    $(@stage.getContainer()).trigger eventName, [@, etc...]

  # Get event position relative to the container.
  mouseOffset: (e) ->
    e = e.originalEvent if 'originalEvent' of e
    e = e.touches[0] if 'touches' of e
    {left, top} = $(@stage.getContainer()).offset()
    x: e.pageX - left
    y: e.pageY - top

module.exports = MarkingTool
