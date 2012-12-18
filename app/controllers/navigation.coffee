$ = require 'jqueryify'
{Controller} = require 'spine'
template = require 'views/navigation'

doc = $(document)

class Navigation extends Controller
  className: 'app-navigation'

  events:
    'change input[name="tool"]': 'onChangeTool'

  constructor: ->
    super

    @el.html template @

    $(window).on 'hashchange', @onHashChange

    setTimeout @onHashChange

  onChangeTool: (e) ->
    doc.trigger 'change-classification-tool', [$(e.target).val()]

  onHashChange: =>
    $('a.active, [data-link].active').removeClass 'active'

    segments = location.hash.split '/'
    hashes = (segments[..i].join '/' for _, i in segments)

    for hash in hashes
      $("a[href='#{hash}'], [data-link='#{hash}']").addClass 'active'

module.exports = Navigation
