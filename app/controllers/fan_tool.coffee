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

  dots: null
  lines: null

  el: null

  cursors: style.cursors

  constructor: ->
    super

    @dots =
      distance: new Kinetic.Circle $.extend {name: 'distance'}, style.circle
      spreadA: new Kinetic.RegularPolygon $.extend {name: 'spread', sides: 4}, style.circle
      spreadB: new Kinetic.RegularPolygon $.extend {name: 'spread', sides: 4}, style.circle

    @lines =
      distance: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.dash
      spread: new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.dash
      bounding: new Kinetic.Path $.extend {name: 'bounding'}, style.line
      hiddenBound: new Kinetic.Path $.extend {name: 'hiddenBound'}, style.hiddenLine

    @group = new Kinetic.Group

    @group.add line for _, line of @lines
    @group.add dot for _, dot of @dots
    @dots.distance.moveToTop()
    @lines.bounding.moveToBottom()
    @layer.add @group

  onFirstClick: (e) ->
    @mark.set
      source: @mouseOffset e
      angle: 90
    super

  onFirstDrag: (e) ->
    @mark.set spread: 5
    @['on drag distance'] e
    super

  'on drag distance': (e) =>
    {x, y} = @mouseOffset e

    deltaX = x - @mark.source.x
    deltaY = y - @mark.source.y
    angle = atan2(deltaY, deltaX) * (180 / PI)

    aSquared = sq x - @mark.source.x
    bSquared = sq y - @mark.source.y
    distance = sqrt aSquared + bSquared

    @mark.set {angle, distance}

  'on drag spread': (e) =>
    {x, y} = @mouseOffset e

    source = @mark.source
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

    $(document).one 'mouseup touchend', =>
      @trigger 'drag-spread'

  'on drag bounding': (e) =>
    @handleDrag e, 'source'

  'on drag hiddenBound': (e) =>
    @handleDrag e, 'source'

  render: ->
    # The triangle made from distance and spread angle:
    adjacent = @mark.distance
    hypotenuse = adjacent / cos @mark.spread / (180 / PI)
    opposite = hypotenuse * sin @mark.spread / (180 / PI)

    inradius = (adjacent * opposite) / (adjacent + opposite + hypotenuse)
    toSpreadHandle = sqrt(sq inradius) + inradius
    spreadHandleX = @mark.distance - toSpreadHandle

    # Don't overlap with the distance handle or the other spread handle.
    spreadHandlePosition = max @targetMin * 2, toSpreadHandle

    @dots.distance.setPosition @mark.distance, 0
    @dots.spreadA.setPosition spreadHandleX, -spreadHandlePosition
    @dots.spreadB.setPosition spreadHandleX, +spreadHandlePosition

    @lines.distance.setPoints [{x: 5, y: 0}, {x: @mark.distance, y: 0}]

    @lines.spread.setPoints [
      {x: spreadHandleX, y: -toSpreadHandle}
      {x: spreadHandleX, y: +toSpreadHandle}
    ]

    @lines.bounding.setData """
      M 5 -2
      L #{spreadHandleX} #{-toSpreadHandle}
      A 1 1 0 1 1 #{spreadHandleX} #{+toSpreadHandle}
      L 5 2
      Z
    """

    @lines.hiddenBound.setData """
      M 0 -5
      L #{spreadHandleX + 5} #{-toSpreadHandle - 5}
      A 1 1 0 1 1 #{spreadHandleX - 5} #{+toSpreadHandle + 5}
      L 0 5
      Z
    """

    @group.setPosition @mark.source
    @group.setRotationDeg @mark.angle

    distancePosition = @dots.distance.getAbsolutePosition()
    @deleteButton.css
      left: "#{(@mark.source.x + distancePosition.x) / 2}px"
      top: "#{(@mark.source.y + distancePosition.y) / 2}px"

    super

  select: ->
    dot.show() for _, dot of @dots
    @lines.distance.show()
    @lines.spread.show()
    super

  deselect: ->
    dot.hide() for _, dot of @dots
    @lines.distance.hide()
    @lines.spread.hide()
    super

module.exports = FanTool
