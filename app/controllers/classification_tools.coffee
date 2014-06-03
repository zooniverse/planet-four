{Controller} = require 'spine'
template = require 'views/classification_tools'
FanTool = require 'controllers/fan_tool'
EllipseTool = require 'controllers/ellipse_tool'
StarPointTool = require 'controllers/star_point_tool'
User = require 'zooniverse/models/user'
Subject = require 'zooniverse/models/subject'

tools =
  fan: FanTool
  blotch: EllipseTool
  interest: StarPointTool

class ClassificationTools extends Controller
  classifier: null

  tool: null

  className: 'classification-tools'

  events:
    'change input[name="tool"]': 'onChangeTool'
    'click button[name="sign-in"]': 'onClickSignIn'
    'change input[name="favorite"]': 'onChangeFavorite'
    'click button[name="start-tutorial"]': 'onClickTutorial'
    'click button[name="field-guide"]': 'onClickFieldGuide'
    'click button[name="finish"]': 'onClickFinish'
    'click button[name="next"]': 'onClickNext'

  elements:
    'input[name="tool"]': 'toolInputs'
    'button.secondary': 'secondaryActions'
    '.for-favorite': 'forFavorite'
    'input[name="favorite"]': 'favoriteCheckbox'
    '.for-sign-in': 'forSignIn'
    '.finish': 'finishControls'
    '.followup': 'followupControls'
    '.followup .talk': 'talkLink'
    '.followup .facebook': 'facebookLink'
    '.followup .twitter': 'twitterLink'

  constructor: ->
    super
    @html template @

    User.on 'change', @onUserSignIn
    Subject.on 'select', @onSubjectSelect

    setTimeout @reset

  onUserSignIn: =>
    signedIn = User.current?
    @el.toggleClass 'signed-in', signedIn
    @forFavorite.toggle signedIn
    @forSignIn.toggle not signedIn

  onSubjectSelect: =>
    @talkLink.attr href: Subject.current.talkHref()
    @facebookLink.attr href: Subject.current.facebookHref()
    @twitterLink.attr href: Subject.current.twitterHref()

  reset: =>
    @toolInputs.first().click()
    @favoriteCheckbox.attr checked: false

  onChangeTool: (e) ->
    @tool = $(e.target).val()
    @classifier.markingSurface.setTool tools[@tool]

  onClickSignIn: ->
    (require('zooniverse/controllers/login-dialog')).show()

  onChangeFavorite: ->
    @classifier.classification.favorite = @favoriteCheckbox.is ':checked'

  onClickTutorial: ->
    app.stack.classify.startTutorial()

  onClickFieldGuide: ->
    Spine.Route.navigate '/about/examples'

  onClickFinish: ->
    @classifier.finishClassification()

    @toolInputs.add(@favoriteCheckbox).attr disabled: true
    @secondaryActions.attr disabled: true

    @finishControls.hide()
    @followupControls.show()

  onClickNext: ->
    @finishControls.show()
    @reset()

    @toolInputs.add(@favoriteCheckbox).attr disabled: false
    @secondaryActions.attr disabled: false

    @followupControls.hide()
    @classifier.selectNextSubject()

module.exports = ClassificationTools
