MarkingTool = require 'controllers/marking_tool'
PointMark = require 'models/point_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class PointTool extends MarkingTool
  @mark: PointMark

  dot: null

  constructor: ->
    super

    @dot = @createTarget new Kinetic.Star $.extend {name: 'point', numPoints: 5, innerRadius: 10, outerRadius: 20}, style.line
    @layer.add @dot

  onFirstClick: ->
    @onFirstDrag arguments...

  onFirstDrag: ([x, y]) ->
    {width, height} = @stage.getSize()
    {left, top} = $(@stage.getContainer()).offset()

    x = (x * width) + left
    y =  (y * height) + top

    dummyEvent = pageX: x, pageY: y, preventDefault: ->

    @['on drag point'] dummyEvent

  'on drag point': (e) ->
    @mark.set @mouseOffset e

  render: ->
    @dot.setPosition x: @mark.x, y: @mark.y
    super

module.exports = PointTool
