MarkingTool = require 'controllers/marking_tool'
EllipseMark = require 'models/ellipse_mark'
Kinetic = window.Kinetic
$ = require 'jqueryify'
style = require 'lib/style'

class EillipseTool extends MarkingTool
  @mark: EllipseMark

  group: null
  radiusHandle1: null
  radiusHandle2: null
  bounding: null

  constructor: ->
    super

    @radiusHandle1 = @createTarget new Kinetic.RegularPolygon $.extend {name: 'radius1'}, style.diamond
    @radiusHandle2 = @createTarget new Kinetic.RegularPolygon $.extend {name: 'radius2'}, style.diamond
    @radiusPath = new Kinetic.Path style.line
    @bounding = new Kinetic.Ellipse $.extend {name: 'bounding', x: 0, y: 0}, style.line

    @group = new Kinetic.Group

    @group.add @radiusHandle1
    @group.add @radiusHandle2
    @group.add @radiusPath
    @group.add @bounding
    @radiusHandle1.moveToTop()
    @radiusHandle2.moveToTop()
    @layer.add @group

  onFirstClick: ([x, y]) ->
    {width, height} = @stage.getSize()

    @mark.set
      center: [x * width, y * height]

    @onFirstDrag [x, y]

  onFirstDrag: ([x, y]) ->
    {width, height} = @stage.getSize()
    {left, top} = $(@stage.getContainer()).offset()
    x = (x * width) + left
    y =  (y * height) + top

    dummyEvent = pageX: x, pageY: y, preventDefault: ->
    @['on drag radius1'] dummyEvent
    @mark.set radius2: @mark.radius1 * 0.75

  'on drag radius1': (e) =>
    {angle, radius} = @dragRadiusHandle e
    @mark.set {angle, radius1: radius}

  'on drag radius2': (e) =>
    {angle, radius} = @dragRadiusHandle e
    angle += 90
    @mark.set {angle, radius2: radius}

  dragRadiusHandle: (e) ->
    {x, y} = @mouseOffset e

    deltaX = x - @mark.center[0]
    deltaY = y - @mark.center[1]
    angle = Math.atan2(deltaY, deltaX) * (180 / Math.PI)

    aSquared = Math.pow x - @mark.center[0], 2
    bSquared = Math.pow y - @mark.center[1], 2
    radius = Math.sqrt aSquared + bSquared

    {angle, radius}

  sourceOffset: null
  'on drag bounding': (e) =>
    {x, y} = @mouseOffset e

    if @sourceOffset
      @mark.set center: [x + @sourceOffset[0], y + @sourceOffset[1]]
    else
      $(document).one 'mouseup', => @sourceOffset = null

    @sourceOffset = [@mark.center[0] - x, @mark.center[1] - y]

  render: ->
    @radiusHandle1.setPosition @mark.radius1, 0
    @radiusHandle2.setPosition 0, -@mark.radius2
    @bounding.setRadius @mark.radius1, @mark.radius2
    @radiusPath.setData """
      M 0 #{-@mark.radius2}
      L 0 0
      L #{@mark.radius1} 0
    """

    @group.setPosition @mark.center...
    @group.setRotationDeg @mark.angle

    super

  # select: ->
  #   @spread.show()
  #   @radius.show()
  #   super

  # deselect: ->
  #   @spread.hide()
  #   @radius.hide()
  #   super

  # remove: ->
  #   super

module.exports = EillipseTool
