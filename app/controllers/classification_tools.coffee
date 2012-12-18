{Controller} = require 'spine'
template = require 'views/classification_tools'
FanTool = require 'controllers/fan_tool'
CircleTool = require 'controllers/circle_tool'

tools =
  fan: FanTool
  interest: CircleTool

class ClassificationTools extends Controller
  classifier: null

  className: 'classification-tools'

  events:
    'change input[name="tool"]': 'onChangeTool'
    'click button[name="finish"]': 'onClickFinish'

  constructor: ->
    super
    @html template @

  onChangeTool: (e) ->
    @classifier.markingSurface.setTool tools[$(e.target).val()]

  onClickFinish: ->
    console.log 'Finished with this subject'

module.exports = ClassificationTools
