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

    @spread = @createTarget new Kinetic.RegularPolygon $.extend {name: 'spread'}, style.diamond
    @radius = new Kinetic.Line $.extend {points: [{x: 0, y: 0}]}, style.dash
    @bounding = new Kinetic.Circle $.extend {name: 'bounding'}, style.line

    @group = new Kinetic.Group

    @group.add @spread
    @group.add @radius
    @group.add @bounding
    @spread.moveToTop()
    @layer.add @group

  onFirstClick: (e) ->
    @mark.set center: @mouseOffset e
    super

  onFirstDrag: (e) ->
    @['on drag spread'] e
    super

  'on drag bounding': (e) =>
    @handleDrag e, 'center'

  'on drag spread': (e) =>
    {x, y} = @mouseOffset e

    deltaX = x - @mark.center.x
    deltaY = y - @mark.center.y
    angle = Math.atan2(deltaY, deltaX) * (180 / Math.PI)

    aSquared = Math.pow x - @mark.center.x, 2
    bSquared = Math.pow y - @mark.center.y, 2
    radius = Math.sqrt aSquared + bSquared

    @mark.set {angle, radius}

  render: ->
    @spread.setPosition @mark.radius, 0
    @radius.setPoints [{x: 0, y: 0}, {x: @mark.radius, y: 0}]
    @bounding.setRadius @mark.radius

    @group.setPosition @mark.center
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

module.exports = CircleTool
