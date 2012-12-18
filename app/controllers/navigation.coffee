$ = require 'jqueryify'
{Controller} = require 'spine'
template = require 'views/navigation'

doc = $(document)

class Navigation extends Controller
  className: 'app-navigation'

  elements:
    '.classify .expando': 'classificationToolsContainer'

  constructor: ->
    super

    @html template @

    $(window).on 'hashchange', @onHashChange
    setTimeout @onHashChange

  onHashChange: =>
    $('a.active, [data-link].active').removeClass 'active'

    segments = location.hash.split '/'
    hashes = (segments[..i].join '/' for _, i in segments)

    for hash in hashes
      $("a[href='#{hash}'], [data-link='#{hash}']").addClass 'active'

module.exports = Navigation
