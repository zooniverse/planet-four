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

    $(window).on 'hashchange', @onHashChange

    @onHashChange()

  onClickTool: (e) ->
    doc.trigger 'change-classification-tool', [$(e.target).val()]

  onHashChange: =>
    $('a.active, [data-link].active').removeClass 'active'

    segments = location.hash.split '/'
    hashes = (segments[..i].join '/' for _, i in segments)

    for hash in hashes
      $("a[href='#{hash}'], [data-link='#{hash}']").addClass 'active'

module.exports = Navigation
