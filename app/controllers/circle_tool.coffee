MarkingTool = require 'controllers/marking_tool'
CircleMark = require 'models/circle_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class CircleTool extends MarkingTool
  @mark: CircleMark

  group: null
  spread: null
  radius: null
  bounding: null

  cursors: style.cursors

  constructor: ->
    super

    @spread = @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.spread
    @radius = new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.realLine
    @bounding = new Kinetic.Circle $.extend {name: 'bounding'}, style.guideLine

    @group = new Kinetic.Group

    @group.add @spread
    @group.add @radius
    @group.add @bounding
    @spread.moveToTop()
    @layer.add @group

  onFirstClick: ([x, y]) ->
    {width, height} = @stage.getSize()

    @mark.set
      source: [x * width, y * height]

    @onFirstDrag [x, y]

  onFirstDrag: ([x, y]) ->
    {width, height} = @stage.getSize()
    {left, top} = $(@stage.getContainer()).offset()
    x = (x * width) + left
    y =  (y * height) + top

    dummyEvent = pageX: x, pageY: y, preventDefault: ->
    @['on drag spread'] dummyEvent

  'on mousedown': (e) =>
    e.preventDefault()
    @select()

  sourceOffset: null
  'on drag bounding': (e) =>
    {x, y} = @mouseOffset e

    if @sourceOffset
      @mark.set source: [x + @sourceOffset[0], y + @sourceOffset[1]]
    else
      $(document).one 'mouseup', => @sourceOffset = null

    @sourceOffset = [@mark.source[0] - x, @mark.source[1] - y]

  'on drag spread': (e) =>
    {x, y} = @mouseOffset e

    deltaX = x - @mark.source[0]
    deltaY = y - @mark.source[1]
    angle = Math.atan2(deltaY, deltaX) * (180 / Math.PI)

    aSquared = Math.pow x - @mark.source[0], 2
    bSquared = Math.pow y - @mark.source[1], 2
    radius = Math.sqrt aSquared + bSquared

    @mark.set {angle, radius}

  render: ->
    @spread.setPosition @mark.radius, 0
    @radius.setPoints [{x: 0, y: 0}, {x: @mark.radius, y: 0}]
    @bounding.setRadius @mark.radius

    @group.setPosition @mark.source...
    @group.setRotationDeg @mark.angle

    super

  select: ->
    @spread.show()
    @radius.show()
    super

  deselect: ->
    @spread.hide()
    @radius.hide()
    super

  remove: ->
    super

module.exports = CircleTool
