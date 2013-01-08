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

    Api.get '/projects/planet_four', (project) =>
      @participantsCount.html project.user_count
      @classificationsCount.html project.classification_count

module.exports = HomePage
