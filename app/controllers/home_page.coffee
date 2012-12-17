{Controller} = require 'spine'
template = require 'views/home_page'

class HomePage extends Controller
  constructor: ->
    super
    @html template @

module.exports = HomePage
