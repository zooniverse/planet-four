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
      tool: FanTool
      classifier: @

    @markingSurface = new MarkingSurface
      el: @subjectContainer
      tool: FanTool
      classifier: @

    @markingSurface.bind 'create-mark', @onCreateMark

    @tutorial = new Tutorial
      steps: tutorialSteps

    User.bind 'sign-in', @onUserSignIn
    Subject.bind 'select'

  onUserSignIn: =>
    tutorialDone = User.current?.project.tutorial_done
    doingTutorial = Subject.current?.metadata.tutorial

    if tutorialDone
      @tutorial?.end()
      @selectNextSubject() if doingTutorial or not Subject.current?
    else
      if @tutorial?
        # Subject.selectTutorial()
        @selectNextSubject()
        @tutorial.start()
      else
        @selectNextSubject()

  selectNextSubject: ->
    @el.addClass 'loading'
    window.next = Subject.next @onSubjectSelect, @onSubjectError

  onSubjectSelect: =>
    @el.removeClass 'loading'
    @markingSurface.marks[0].destroy() until @markingSurface.marks.length is 0
    @classification = new Classification subject: Subject.current
    @subjectImg.attr src: 'images/example-subject.jpg' # Subject.current.location.standard[0]

  onSubjectError: =>
    @el.removeClass 'loading'
    alert 'Error fetching subjects. Maybe we\'re out!'

  onCreateMark: (mark) =>
    # Re-assign the "type" property.
    mark.set type: switch mark.type
      when 'circle' then 'blotch'
      when 'fan' then 'fan'

    @classification.marks.push mark

    mark.bind 'destroy', =>
      @classification.marks.splice i, 1 for m, i in @classification.marks when m is mark

  finishClassification: ->
    @classification.send()

  activate: ->
    super
    html.addClass 'on-classify'
    # TODO: Show tutorial if we're on it.

  deactivate: ->
    super
    html.removeClass 'on-classify'
    # TODO: Hide tutorial if we're on it.

module.exports = ClassifyPage
