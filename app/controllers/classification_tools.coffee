{Controller} = require 'spine'
template = require 'views/classification_tools'
FanTool = require 'controllers/fan_tool'
CircleTool = require 'controllers/circle_tool'
StarPointTool = require 'controllers/star_point_tool'

tools =
  fan: FanTool
  blotch: CircleTool
  interest: StarPointTool

class ClassificationTools extends Controller
  classifier: null

  className: 'classification-tools'

  events:
    'change input[name="tool"]': 'onChangeTool'
    'click button[name="finish"]': 'onClickFinish'
    'click button[name="next"]': 'onClickNext'

  elements:
    'input[name="tool"]': 'toolInputs'
    '.finish': 'finishControls'
    '.followup': 'followupControls'

  constructor: ->
    super
    @html template @

  onChangeTool: (e) ->
    @classifier.markingSurface.setTool tools[$(e.target).val()]

  onClickFinish: ->
    @classifier.finishClassification()
    @toolInputs.attr disabled: true
    @finishControls.hide()
    @followupControls.show()

  onClickNext: ->
    @finishControls.show()
    @toolInputs.attr disabled: false
    @followupControls.hide()
    @classifier.selectNextSubject()

module.exports = ClassificationTools
