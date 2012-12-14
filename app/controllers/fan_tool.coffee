MarkingTool = require 'controllers/marking_tool'
FanMark = require 'models/fan_mark'
Kinetic = window.Kinetic

class FanTool extends MarkingTool
  @mark: FanMark

  group: null
  dots: null
  lines: null

  constructor: ->
    super

    @dots =
      source: new Kinetic.Circle {x: 0, y: 0, radius: 5, fill: 'red'}
      distance: new Kinetic.Circle {x: 100, y: 0, radius: 5, fill: 'red'}
      spreadA: new Kinetic.Circle {radius: 5, fill: 'blue'}
      spreadB: new Kinetic.Circle {radius: 5, fill: 'blue'}

    @lines =
      distance: new Kinetic.Line {points: [{x: 0, y: 0}], stroke: 'black', strokeWidth: 2}
      spread: new Kinetic.Line {points: [{x: 0, y: 0}], stroke: 'black', strokeWidth: 2}
      bounding: new Kinetic.Path {stroke: 'gray', strokeWidth: 1}

    @group = new Kinetic.Group

    @group.add line for _, line of @lines
    @group.add dot for _, dot of @dots
    @layer.add @group

  onFirstClick: ([x, y]) ->
    {width, height} = @stage.getSize()

    @mark.set
      source: [x * width, y * height]
      distance: 0

  onFirstDrag: ([x, y]) ->
    {width, height} = @stage.getSize()

    x *= width
    y *= height

    deltaX = x - @mark.source[0]
    deltaY = y - @mark.source[1]
    angle = Math.atan2(deltaY, deltaX) * (180 / Math.PI)

    aSquared = Math.pow x - @mark.source[0], 2
    bSquared = Math.pow y - @mark.source[1], 2
    distance = Math.sqrt aSquared + bSquared

    spread = distance / 5

    @mark.set {angle, distance, spread}

  render: ->
    @dots.distance.setPosition @mark.distance, 0
    @dots.spreadA.setPosition @mark.distance, -@mark.spread
    @dots.spreadB.setPosition @mark.distance, +@mark.spread

    @lines.distance.setPoints [{x: 0, y: 0}, {x: @mark.distance, y: 0}]
    @lines.spread.setPoints [{x: @mark.distance, y: -@mark.spread}, {x: @mark.distance, y: +@mark.spread}]
    @lines.bounding.setData """
      M 0 0
      L #{@mark.distance} #{-@mark.spread}
      A 1 1 0 1 1 #{@mark.distance} #{+@mark.spread}
      Z
    """

    @group.setPosition @mark.source...
    @group.setRotationDeg @mark.angle

    super

module.exports = FanTool
