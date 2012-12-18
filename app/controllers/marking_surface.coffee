{Controller} = require 'spine'
Kinetic = window.Kinetic
$ = require 'jqueryify'

class MarkingSurface extends Controller
  tool: null

  stage: null

  marks: null
  tools: null

  selection: null

  events:
    'mousedown': 'onMouseDown'
    'keydown': 'onKeyDown'

  constructor: ->
    super

    @el ?= document.createElement 'div'
    @el = $(@el)

    @el.attr tabindex: 0

    @stage = new Kinetic.Stage
      container: @el.get 0
      width: @el.width()
      height: @el.height()

    @marks ?= []
    @tools ?= []

    @setTool @tool

  setTool: (tool) ->
    @tool = tool

  onMouseDown: (e) =>
    return if e.isDefaultPrevented()
    return unless @tool?
    e.preventDefault()
    @el.focus()

    {x, y} = @mouseOffset e

    if (not @selection) or @selection.isComplete()
      mark = new @tool.mark
      @marks.push mark

      mark.bind 'destroy', =>
        @marks.splice i, 1 for m, i in @marks when m is mark

      tool = new @tool {mark, @stage}
      @tools.push tool

      tool.bind 'select', =>
        @selection = tool
        t.deselect() for t in @tools when t isnt tool

      tool.bind 'deselect', =>
        @selection = null if @selection is tool

      tool.bind 'remove', =>
        @tools.splice i, 1 for t, i in @tools when t is tool
        @tools[@tools.length - 1]?.select() if @selection is tool

      tool.select()

      tool.onFirstClick [x, y]

    doc = $(document)

    doc.on 'mousemove', @onStageDrag
    doc.one 'mouseup', =>
      doc.off 'mousemove', @onStageDrag

  onStageDrag: (e) =>
    {x, y}  = @mouseOffset e
    @selection.onFirstDrag [x, y]

  onKeyDown: (e) ->
    if e.which in [8, 46] # Backspace and delete
      e.preventDefault()
      @selection?.mark.destroy()

  mouseOffset: (e) ->
    {left, top} = @el.offset()
    x: (e.pageX - left) / @el.width()
    y: (e.pageY - top) / @el.height()

module.exports = MarkingSurface
