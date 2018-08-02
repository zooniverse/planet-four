SubPage = require './sub_page'
translate = require 't7e'
developersView = require 'views/developers'
scientistsView = require 'views/scientists'
moderatorsView = require 'views/moderators'

class ResultsPage extends SubPage
    content: translate 'span', 'results'

module.exports = ResultsPage
