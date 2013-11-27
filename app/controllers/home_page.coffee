{Controller} = require 'spine'
template = require 'views/home_page'
Api = require 'zooniverse/lib/api'
formatNumber = require 'lib/formatNumber'

class HomePage extends Controller
  className: 'home-page'

  elements:
    '.participants': 'participantsCount'
    '.area': 'areaCount'
    '.classifications': 'classificationsCount'

  constructor: ->
    super
    @html template @

    Api.current.get '/projects/planet_four', (project) =>
      @participantsCount.html formatNumber project.classifier_count
      @classificationsCount.html formatNumber project.classification_count

module.exports = HomePage
