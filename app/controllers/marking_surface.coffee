{Controller} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'

class MarkingSurface extends Controller
  tool: null

  stage: null

  events:
    'mousedown': 'onMouseDown'

  constructor: ->
    super

    @stage = new Kinetic.Stage
      container: @el.get 0
      width: @el.width()
      height: @el.height()

  onResize: =>
    @stage.setSize width: @el.width(), height: @el.height()

  onMouseDown: (e) =>
    return unless @tool?

    e.preventDefault()

    $(document).on 'mousemove', @onStageDrag
    $(document).one 'mouseup', =>
      $(document).off 'mousemove', @onStageDrag

    {x, y} = @stage.getMousePosition()

    mark = new @tool {@stage}
    mark.startAt [x, y]

  onStageDrag: (e) =>
    console.log 'Stage drag', @stage.getMousePosition()

module.exports = MarkingSurface
