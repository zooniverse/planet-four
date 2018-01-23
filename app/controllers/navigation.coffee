$ = window.jQuery
{Controller} = require 'spine'
template = require 'views/navigation'

doc = $(document)

class Navigation extends Controller
  className: 'app-navigation'

  elements:
    '.expando': 'expandos'
    '.classify .expando': 'classificationToolsContainer'

  constructor: ->
    super

    @html template @

    $(window).on 'hashchange', @onHashChange
    setTimeout @onHashChange

  onHashChange: =>
    @activateLinks()
    @expandExpandos()

  expandExpandos: ->
    for expando in @expandos then do (expando) =>
      expando = $(expando)
      active = expando.parent().hasClass 'active'

      height = if active then @naturalHeight(expando) else 0
      opacity = if active then 1 else 0

      expando.animate {height, opacity}, ->
        expando.css height: '', opacity: '' if active

  activateLinks: ->
    $('a.active, [data-link].active').removeClass 'active'

    segments = location.hash.split '/'
    hashes = (segments[..i].join '/' for _, i in segments)

    for hash in hashes
      $("a[href='#{hash}'], [data-link='#{hash}']").addClass 'active'

  naturalHeight: (el) ->
    originalHeight = el.css 'height'
    el.css height: 'auto'
    naturalHeight = el.height()
    el.css height: originalHeight
    naturalHeight

module.exports = Navigation
