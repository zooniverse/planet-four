FanTool = require 'controllers/fan_tool'
CircleTool = require 'controllers/circle_tool'
{Controller} = require 'spine'
template = require 'views/classify_page'
MarkingSurface = require 'controllers/marking_surface'
$ = require 'jqueryify'

tools =
  fan: FanTool
  interest: CircleTool

class ClassifyPage extends Controller
  className: 'classify-page'

  markingSurface: null

  elements:
    '.subject-container': 'subjectContainer'

  constructor: ->
    super

    @html template @

    @markingSurface = new MarkingSurface
      el: @subjectContainer
      tool: FanTool

    $(document).on 'change-classification-tool', (e, tool) =>
      console.log 'Got tool', tool, tools[tool]
      @markingSurface.setTool tools[tool]

module.exports = ClassifyPage
