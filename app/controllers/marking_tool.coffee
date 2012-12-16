Mark = require 'models/mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class MarkingTool
  @mark: Mark

  mark: null
  stage: null

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

    @layer.on 'mousedown', @onMouseDown

    if @cursors
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

  # Where "something" is the name of a shape,
  # methods named "onDragSomething" will be automatically called.
  onMouseDown: (e) =>
    @select()

    name = e.shape.getName()
    return unless name?

    cappedName = name.charAt(0).toUpperCase() + name[1...]
    onDrag = @["onDrag#{cappedName}"]

    if typeof onDrag is 'function'
      e.preventDefault()

      doc = $(document)
      doc.on 'mousemove', onDrag
      doc.one 'mouseup', =>
        doc.off 'mousemove', onDrag

  render: =>
    # Draw dots and lines or whatever.
    @layer.draw()

  select: ->
    # @layer.setOpacity 1
    @layer.moveToTop()
    @layer.draw()

  deselect: ->
    # @layer.setOpacity 0.33
    @layer.draw()

  remove: =>
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
