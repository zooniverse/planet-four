{Controller} = require 'spine'
template = require 'views/classify_page'
ClassificationTools = require 'controllers/classification_tools'
MarkingSurface = require 'controllers/marking_surface'
FanTool = require 'controllers/fan_tool'
$ = require 'jqueryify'
User = require 'zooniverse/lib/models/user'
Subject = require 'models/subject'
Classification = require 'models/classification'
{Tutorial} = require 'zootorial'
tutorialSteps = require 'lib/tutorial_steps'

html = $(document.body.parentNode)

class ClassifyPage extends Controller
  className: 'classify-page'

  classificationTools: null
  markingSurface: null

  elements:
    '.subject-container': 'subjectContainer'
    '.subject-container .subject': 'subjectImg'

  constructor: ->
    super

    @html template @

    @classificationTools = new ClassificationTools
      classifier: @

    @markingSurface = new MarkingSurface
      el: @subjectContainer
      classifier: @

    @markingSurface.bind 'create-mark', @onCreateMark

    @tutorial = new Tutorial
      steps: tutorialSteps

    User.bind 'sign-in', @onUserSignIn

    Subject.bind 'selected', @onSubjectSelect

  onUserSignIn: =>
    tutorialDone = User.current?.project.classification_count > 0
    doingTutorial = Subject.current?.metadata.tutorial

    if tutorialDone
      @tutorial?.end()
      @selectNextSubject() if doingTutorial or not Subject.current?
    else
      if @tutorial?
        Subject.selectTutorial()
        @tutorial.start()
        @tutorial.hide() unless @el.hasClass 'active'
      else
        @selectNextSubject()

  selectNextSubject: ->
    @el.addClass 'loading'
    next = Subject.next()
    next.fail @onSubjectError

  onSubjectSelect: =>
    @el.removeClass 'loading'
    @markingSurface.marks[0].destroy() until @markingSurface.marks.length is 0
    @classification = new Classification subject: Subject.current
    @subjectImg.attr src: Subject.current.location.standard

  onSubjectError: =>
    @el.removeClass 'loading'
    alert 'Error fetching subjects. Maybe we\'re out!'

  onCreateMark: (mark) =>
    # Re-assign the "type" property.
    mark.set type: @classificationTools.tool

    @classification.marks.push mark

    mark.bind 'destroy', =>
      @classification.marks.splice i, 1 for m, i in @classification.marks when m is mark

  finishClassification: ->
    @classification.send()

  activate: ->
    super
    html.addClass 'on-classify'
    @tutorial.show() if Subject.current?.metadata.tutorial

  deactivate: ->
    super
    html.removeClass 'on-classify'
    @tutorial.hide() if Subject.current?.metadata.tutorial

module.exports = ClassifyPage
