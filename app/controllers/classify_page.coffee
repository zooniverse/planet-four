{Controller} = require 'spine'
translate = require 't7e'
template = require 'views/classify_page'
ClassificationTools = require 'controllers/classification_tools'
MarkingSurface = require 'controllers/marking_surface'
FanTool = require 'controllers/fan_tool'
$ = require 'jqueryify'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'
{Tutorial} = require 'zootorial'
tutorialSteps = require 'lib/tutorial_steps'

html = $(document.body.parentNode)

class ClassifyPage extends Controller
  className: 'classify-page'

  classificationTools: null
  markingSurface: null

  events:
    'click button[name="start-tutorial"]': 'startTutorial'
    'click button[name="sign-in"]': 'onClickSignIn'

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

    User.on 'change', @onUserSignIn
    Subject.on 'select', @onSubjectSelect

  onUserSignIn: =>
    @el.toggleClass 'signed-in', User.current?
    tutorialDone = User.current?.project.classification_count > 0
    doingTutorial = Subject.current?.metadata.tutorial

    if tutorialDone
      @tutorial?.end()
      @tutorial?.dialog.close()
      @selectNextSubject() if doingTutorial or not Subject.current?
    else
      if @tutorial?
        @startTutorial()
        unless @el.hasClass 'active'
          @tutorial.dialog.el.hide()
      else
        @selectNextSubject()

  startTutorial: ->
    tutorialSubject = new Subject
      id: '50eb8c5c3ae74028ea000001'
      zooniverse_id: 'APF0000x3t'
      workflow_ids: ['50e9e3d33ae740f1f3000002']
      location: standard: 'images/tutorial-subject.jpg'
      coords: [-81.801, 76.14]
      metadata:
        tutorial: true
    tutorialSubject.select()

    @tutorial?.start()

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
    alert translate 'classify.outOfSubjects'

  onCreateMark: (mark) =>
    # Re-assign the "type" property.
    mark.set type: @classificationTools.tool

    @classification.annotate mark

    mark.bind 'destroy', =>
      @classification.removeAnnotation mark

  finishClassification: ->
    @classification.send()

  onClickSignIn: ->
    (require('zooniverse/controllers/login-dialog')).show()

  activate: ->
    super
    html.addClass 'on-classify'
    if Subject.current?.metadata.tutorial
      @tutorial.dialog.el.show()
      @tutorial.dialog.attach()

  deactivate: ->
    super
    html.removeClass 'on-classify'
    @tutorial.dialog.el.hide() if Subject.current?.metadata.tutorial

module.exports = ClassifyPage
