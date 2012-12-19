{Controller} = require 'spine'
template = require 'views/classify_page'
ClassificationTools = require 'controllers/classification_tools'
MarkingSurface = require 'controllers/marking_surface'
FanTool = require 'controllers/fan_tool'
$ = require 'jqueryify'
Subject = require 'models/subject'

html = $(document.body.parentNode)

class ClassifyPage extends Controller
  className: 'classify-page'

  classificationTools: null
  markingSurface: null

  elements:
    '.subject-container': 'subjectContainer'

  constructor: ->
    super

    @html template @

    @classificationTools = new ClassificationTools
      tool: FanTool
      classifier: @

    @markingSurface = new MarkingSurface
      el: @subjectContainer
      tool: FanTool
      classifier: @

  activate: ->
    super
    html.addClass 'on-classify'

  deactivate: ->
    super
    html.removeClass 'on-classify'

module.exports = ClassifyPage
