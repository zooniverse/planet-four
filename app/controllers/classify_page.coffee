{Controller} = require 'spine'
template = require 'views/classify_page'

class ClassifyPage extends Controller
  className: 'classify-page'

  constructor: ->
    super

    @html template @

module.exports = ClassifyPage
