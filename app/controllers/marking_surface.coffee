{Controller} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'

class MarkingSurface extends Controller
  tool: null

  stage: null

  selection: null

  events:
    'mousedown': 'onMouseDown'

  constructor: ->
    super

    @stage = new Kinetic.Stage
      container: @el.get 0
      width: @el.width()
      height: @el.height()

    @setTool @tool

  setTool: (tool) ->
    @tool = tool

  onMouseDown: (e) =>
    return unless @tool?
    e.preventDefault()

    {x, y} = @mouseOffset e

    if (not @lastTool) or @lastTool.isComplete()
      @lastMark = new @tool.mark
      @lastTool = new @tool mark: @lastMark, stage: @stage
      @lastTool.onFirstClick [x, y]

    doc = $(document)

    doc.on 'mousemove', @onStageDrag
    doc.one 'mouseup', =>
      doc.off 'mousemove', @onStageDrag

  onStageDrag: (e) =>
    {x, y}  = @mouseOffset e
    @lastTool.onFirstDrag [x, y]

  mouseOffset: (e) ->
    {left, top} = @el.offset()
    x: (e.pageX - left) / @el.width()
    y: (e.pageY - top) / @el.height()

module.exports = MarkingSurface
