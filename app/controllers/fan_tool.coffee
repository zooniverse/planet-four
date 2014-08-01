MarkingTool = require 'controllers/marking_tool'
FanMark = require 'models/fan_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'
optionsTemplate = require 'views/fan_tool_options'

# Destructure math for convenience.
{abs, atan2, cos, max, PI, pow, sin, sqrt, tan} = Math
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
      wrongAngle: new Kinetic.Path $.extend({name: 'bounding'}, style.line, {stroke: 'red'})

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
    x -= @mark.source.x
    y -= @mark.source.y

    mouseAngle = atan2(y, x) * (180 / PI)
    totalAngle = abs (mouseAngle - @mark.angle) * 2

    @mark.set spread: totalAngle

    $(document).one 'mouseup touchend', =>
      @trigger 'drag-spread'

  'on drag bounding': (e) =>
    @handleDrag e, 'source'

  'on drag hiddenBound': (e) =>
    @handleDrag e, 'source'

  render: ->
    halfSpread = (@mark.spread / 2) / (180 / PI)

    # The right triangle made from distance and half the spread angle:
    adjacent = @mark.distance
    hypotenuse = adjacent / cos(halfSpread)
    opposite = adjacent * tan(halfSpread)

    spreadRadius = (hypotenuse * sin halfSpread) / (1 + tan halfSpread) # THANKS BROOKE AND GREG!
    spreadX = @mark.distance - spreadRadius

    @dots.distance.setPosition @mark.distance, 0
    @dots.spreadA.setPosition spreadX, -max style.circle.radius * 2.5, spreadRadius
    @dots.spreadB.setPosition spreadX, +max style.circle.radius * 2.5, spreadRadius

    @lines.distance.setPoints [{x: 0, y: 0}, {x: @mark.distance, y: 0}]

    @lines.spread.setPoints [
      {x: spreadX, y: -spreadRadius}
      {x: spreadX, y: +spreadRadius}
    ]

    @lines.bounding.setData """
      M 0 0
      L #{spreadX} #{-spreadRadius}
      A 1 1 0 1 1 #{spreadX} #{spreadRadius}
      L #{spreadX} #{+spreadRadius}
      Z
    """

    @lines.hiddenBound.setData """
      M -5 0
      L #{spreadX} #{-spreadRadius - 5}
      A 1 1 0 1 1 #{spreadX} #{spreadRadius + 5}
      L #{spreadX} #{+spreadRadius + 5}
      Z
    """

    @group.setPosition @mark.source
    @group.setRotationDeg @mark.angle

    distancePosition = @dots.distance.getAbsolutePosition()
    @deleteButton.css
      left: "#{(@mark.source.x + distancePosition.x) / 2}px"
      top: "#{(@mark.source.y + distancePosition.y) / 2}px"

    if location.search.indexOf('render-wrong-spread=1') isnt -1
      rightSpread = Math.atan(spreadRadius / spreadX) * 2 * (180 / PI)
      wrongSpread = @renderWrongSpread()

      console?.log "#{rightSpread.toFixed 4} means #{wrongSpread.toFixed 4} #{(wrongSpread / rightSpread).toFixed 4}"

    super

  renderWrongSpread: ->
    adjacent = @mark.distance
    hypotenuse = adjacent / cos @mark.spread / (180 / PI)
    opposite = hypotenuse * sin @mark.spread / (180 / PI)

    inradius = (adjacent * opposite) / (adjacent + opposite + hypotenuse)
    toSpreadHandle = inradius * 2
    spreadHandleX = @mark.distance - toSpreadHandle

    @lines.wrongAngle.setData """
      M 0 0
      L #{spreadHandleX} #{-toSpreadHandle}
      A 1 1 0 1 1 #{spreadHandleX} #{+toSpreadHandle}
      L 0 0
      Z
    """

    Math.atan(toSpreadHandle / spreadHandleX) * 2 * (180 / PI)

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
