SubPage = require './sub_page'
translate = require 't7e'
developersView = require 'views/developers'
scientistsView = require 'views/scientists'
moderatorsView = require 'views/moderators'

class AuthorsPage extends SubPage
    content: translate 'span', 'authors'

module.exports = AuthorsPage
