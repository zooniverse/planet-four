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

  onFirstClick: (e) ->
    @onFirstDrag e

  onFirstDrag: (e) ->
    @['on drag point'] e

  'on drag point': (e) ->
    @mark.set @mouseOffset e

  render: ->
    @dot.setPosition x: @mark.x, y: @mark.y
    super

module.exports = PointTool
