{Controller} = require 'spine'
template = require 'views/classify_page'

class ClassifyPage extends Controller
  constructor: ->
    super

    @html template @

module.exports = ClassifyPage
