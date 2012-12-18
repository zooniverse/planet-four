MarkingTool = require 'controllers/marking_tool'
FanMark = require 'models/fan_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'
optionsTemplate = require 'views/fan_tool_options'

class FanTool extends MarkingTool
  @mark: FanMark

  group: null
  dots: null
  lines: null

  el: null

  cursors: style.cursors

  constructor: ->
    super

    @dots =
      distance: @createTarget new Kinetic.Circle $.extend {name: 'distance'}, style.distance
      spreadA: @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.spread
      spreadB: @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.spread

    @lines =
      distance: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.realLine
      spread: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.realLine
      bounding: new Kinetic.Path $.extend {name: 'bounding'}, style.guideLine

    @group = new Kinetic.Group

    @group.add line for _, line of @lines
    @group.add dot for _, dot of @dots
    @dots.distance.moveToTop()
    @lines.bounding.moveToBottom()
    @layer.add @group

    @el = $(optionsTemplate @)
    @el.css position: 'absolute'
    @el.appendTo @stage.getContainer()
    @el.on 'mousedown', @['on mousedown']

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
    @['on drag distance'] dummyEvent

    spread = @mark.distance / 5
    @mark.set {spread}

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

  'on drag distance': (e) =>
    {x, y} = @mouseOffset e

    deltaX = x - @mark.source[0]
    deltaY = y - @mark.source[1]
    angle = Math.atan2(deltaY, deltaX) * (180 / Math.PI)

    aSquared = Math.pow x - @mark.source[0], 2
    bSquared = Math.pow y - @mark.source[1], 2
    distance = Math.sqrt aSquared + bSquared

    @mark.set {angle, distance}

  'on drag spread': (e) =>
    {x, y} = @mouseOffset e
    distance = @dots.distance.getAbsolutePosition()

    aSquared = Math.pow x - distance.x, 2
    bSquared = Math.pow y - distance.y, 2
    spread = Math.sqrt aSquared + bSquared

    @mark.set {spread}

  render: ->
    @dots.distance.setPosition @mark.distance, 0
    @dots.spreadA.setPosition @mark.distance, -@mark.spread
    @dots.spreadB.setPosition @mark.distance, +@mark.spread

    @lines.distance.setPoints [{x: 0, y: 0}, {x: @mark.distance, y: 0}]
    @lines.spread.setPoints [{x: @mark.distance, y: -@mark.spread}, {x: @mark.distance, y: +@mark.spread}]
    @lines.bounding.setData """
      M 15 -5
      L #{@mark.distance} #{-@mark.spread}
      A 1 1 0 1 1 #{@mark.distance} #{+@mark.spread}
      L 15 5
      Z
    """

    @group.setPosition @mark.source...
    @group.setRotationDeg @mark.angle

    spreadAPos = @dots.spreadA.getAbsolutePosition()
    spreadBPos = @dots.spreadB.getAbsolutePosition()
    elWidth = @el.width()
    elHeight = @el.height()

    @el.css switch
      when -90 < @mark.angle <= 0 # Quadrant I
        left: ((@mark.source[0] + spreadAPos.x) / 2) - elWidth
        top: (@mark.source[1] + spreadAPos.y) / 2 - elHeight

      when -180 < @mark.angle <= -90 # Quadrant II
        left: (@mark.source[0] + spreadBPos.x) / 2
        top: (@mark.source[1] + spreadBPos.y) / 2 - elHeight

      when 90 < @mark.angle <= 180 # Quadrant III
        left: (@mark.source[0] + spreadAPos.x) / 2
        top: (@mark.source[1] + spreadAPos.y) / 2

      when 0 < @mark.angle <= 90 # Quadrant IV
        left: ((@mark.source[0] + spreadBPos.x) / 2) - elWidth
        top: (@mark.source[1] + spreadBPos.y) / 2

      else
        left: 0
        top: 0

    super

  select: ->
    dot.show() for _, dot of @dots
    @lines.distance.show()
    @lines.spread.show()
    @lines.bounding.setStrokeWidth style.guideLine.strokeWidth
    @el.show()
    super

  deselect: ->
    dot.hide() for _, dot of @dots
    @lines.distance.hide()
    @lines.spread.hide()
    @lines.bounding.setStrokeWidth 0
    @el.hide()
    super

  remove: ->
    @el.remove()
    super

module.exports = FanTool
