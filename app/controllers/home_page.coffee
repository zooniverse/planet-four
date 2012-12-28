{Controller} = require 'spine'
template = require 'views/home_page'
Api = require 'zooniverse/lib/api'

class HomePage extends Controller
  className: 'home-page'

  elements:
    '.participants.count': 'participantsCount'
    '.classifications.count': 'classificationsCount'

  constructor: ->
    super
    @html template @

    Api.get '/projects/serengeti', (project) =>
      @participantsCount.html project.user_count
      @classificationsCount.html project.classification_count

module.exports = HomePage
