$ = require 'jqueryify'
{Controller} = require 'spine'
template = require 'views/navigation'

doc = $(document)

class Navigation extends Controller
  className: 'app-navigation'

  events:
    'click button[name="tool"]': 'onClickTool'

  constructor: ->
    super
    @el.html template @

  onClickTool: (e) ->
    doc.trigger 'change-classification-tool', $(e.target).val()

module.exports = Navigation
