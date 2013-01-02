MarkingTool = require 'controllers/marking_tool'
PointMark = require 'models/point_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class PointTool extends MarkingTool
  @mark: PointMark

  constructor: ->
    super

    @shape = @createTarget new Kinetic.Star $.extend {name: 'point', numPoints: 5, innerRadius: 20, outerRadius: 50}, style.line
    @layer.add @shape

  onFirstClick: (e) ->
    @onFirstDrag e
    super

  onFirstDrag: (e) ->
    @['on drag point'] e
    super

  'on drag point': (e) ->
    @mark.set @mouseOffset e

  render: ->
    @shape.setPosition x: @mark.x, y: @mark.y

    @deleteButton.css
      left: "#{@mark.x + 20}px"
      top: "#{@mark.y + 20}px"

    super

module.exports = PointTool
