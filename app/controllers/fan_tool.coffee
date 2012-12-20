MarkingTool = require 'controllers/marking_tool'
FanMark = require 'models/fan_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'
optionsTemplate = require 'views/fan_tool_options'

# Destructure math for convenience.
{acos, atan2, cos, max, PI, pow, sin, sqrt} = Math
sq = (n) -> pow n, 2

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
      distance: @createTarget new Kinetic.Circle $.extend {name: 'distance'}, style.circle
      spreadA: @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.diamond
      spreadB: @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.diamond

    @lines =
      distance: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.dash
      spread: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.dash
      bounding: new Kinetic.Path $.extend {name: 'bounding'}, style.line

    @group = new Kinetic.Group

    @group.add line for _, line of @lines
    @group.add dot for _, dot of @dots
    @dots.distance.moveToTop()
    @lines.bounding.moveToBottom()
    @layer.add @group

    # @el = $(optionsTemplate @)
    # @el.css position: 'absolute'
    # @el.appendTo @stage.getContainer()
    # @el.on 'mousedown', @['on mousedown']

  onFirstClick: ([x, y]) ->
    {width, height} = @stage.getSize()

    @mark.set source: [x * width, y * height]

    @onFirstDrag [x, y]

  onFirstDrag: ([x, y]) ->
    {width, height} = @stage.getSize()
    {left, top} = $(@stage.getContainer()).offset()
    x = (x * width) + left
    y =  (y * height) + top

    dummyEvent = pageX: x, pageY: y, preventDefault: ->
    @['on drag distance'] dummyEvent

  sourceOffset: null
  'on drag bounding': (e) =>
    {x, y} = @mouseOffset e

    if @sourceOffset
      @mark.set source: [x + @sourceOffset[0], y + @sourceOffset[1]]
    else
      $(document).one 'mouseup touchend', => @sourceOffset = null

    @sourceOffset = [@mark.source[0] - x, @mark.source[1] - y]

  'on drag distance': (e) =>
    {x, y} = @mouseOffset e

    deltaX = x - @mark.source[0]
    deltaY = y - @mark.source[1]
    angle = atan2(deltaY, deltaX) * (180 / PI)

    aSquared = sq x - @mark.source[0]
    bSquared = sq y - @mark.source[1]
    distance = sqrt aSquared + bSquared

    @mark.set {angle, distance}

  'on drag spread': (e) =>
    {x, y} = @mouseOffset e

    source = x: @mark.source[0], y: @mark.source[1]
    distance = @dots.distance.getAbsolutePosition()

    aSquaredSD = sq source.x - distance.x
    bSquaredSD = sq source.y - distance.y
    sd = @mark.distance

    aSquaredS = sq x - source.x
    bSquaredS = sq y - source.y
    sc = sqrt aSquaredS + bSquaredS

    aSquaredD = sq x - distance.x
    bSquaredD = sq y - distance.y
    cd = sqrt aSquaredD + bSquaredD

    angleDistanceLengthToMouse = (acos((sq(sd) + sq(sc) - sq(cd)) / (2 * sd * sc)) * (180 / PI))

    @mark.set {spread: angleDistanceLengthToMouse}

  render: ->
    # The triangle made from distance and spread angle:
    adjacent = @mark.distance
    hypotenuse = adjacent / cos @mark.spread / (180 / PI)
    opposite = hypotenuse * sin @mark.spread / (180 / PI)

    # NOTE: Inradius is the wrong thing to use, but it's close enough for now.
    twiceInradius = ((adjacent * opposite) / (adjacent + opposite + hypotenuse)) * 2
    spreadHandleX = @mark.distance - twiceInradius

    # Don't overlap with the distance handle or the other spread handle.
    spreadHandlePosition = max @targetMin * 2, twiceInradius

    @dots.distance.setPosition @mark.distance, 0
    @dots.spreadA.setPosition spreadHandleX, -spreadHandlePosition
    @dots.spreadB.setPosition spreadHandleX, +spreadHandlePosition

    @lines.distance.setPoints [{x: 5, y: 0}, {x: @mark.distance, y: 0}]

    @lines.spread.setPoints [
      {x: spreadHandleX, y: -twiceInradius}
      {x: spreadHandleX, y: +twiceInradius}
    ]

    @lines.bounding.setData """
      M 5 -2
      L #{spreadHandleX} #{-twiceInradius}
      A 1 1 0 1 1 #{spreadHandleX} #{+twiceInradius}
      L 5 2
      Z
    """

    @group.setPosition @mark.source...
    @group.setRotationDeg @mark.angle

    # spreadAPos = @dots.spreadA.getAbsolutePosition()
    # spreadBPos = @dots.spreadB.getAbsolutePosition()
    # elWidth = @el.width()
    # elHeight = @el.height()

    # @el.css switch
    #   when -90 < @mark.angle <= 0 # Quadrant I
    #     left: ((@mark.source[0] + spreadAPos.x) / 2) - elWidth
    #     top: (@mark.source[1] + spreadAPos.y) / 2 - elHeight

    #   when -180 < @mark.angle <= -90 # Quadrant II
    #     left: (@mark.source[0] + spreadBPos.x) / 2
    #     top: (@mark.source[1] + spreadBPos.y) / 2 - elHeight

    #   when 90 < @mark.angle <= 180 # Quadrant III
    #     left: (@mark.source[0] + spreadAPos.x) / 2
    #     top: (@mark.source[1] + spreadAPos.y) / 2

    #   when 0 < @mark.angle <= 90 # Quadrant IV
    #     left: ((@mark.source[0] + spreadBPos.x) / 2) - elWidth
    #     top: (@mark.source[1] + spreadBPos.y) / 2

    #   else
    #     left: 0
    #     top: 0

    super

  select: ->
    dot.show() for _, dot of @dots
    @lines.distance.show()
    @lines.spread.show()
    # @el.show().css display: ''
    super

  deselect: ->
    dot.hide() for _, dot of @dots
    @lines.distance.hide()
    @lines.spread.hide()
    # @el.hide()
    super

  remove: ->
    # @el.remove()
    super

module.exports = FanTool
