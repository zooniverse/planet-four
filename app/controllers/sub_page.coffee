{Controller} = require 'spine'

class SubPage extends Controller
  className: 'sub-page'

  content: ''

  constructor: ->
    super
    @html @content

  activate: ->
    super

    # Activate the parent stack and deactivate the parent stack's siblings.
    for controller of @stack.stack.controllers
      controller = @stack.stack[controller]
      return unless controller?

      if controller is @stack
        controller.activate()
      else
        controller.deactivate()

module.exports = SubPage
