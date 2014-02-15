{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
Profile = require 'zooniverse/controllers/profile'
User = require 'zooniverse/models/user'
Recent = require 'zooniverse/models/recent'
Favorite = require 'zooniverse/models/favorite'

class PlanetFourProfile extends SubPage
  profile: null
  types: ['recents', 'favorites']
  defaultType: 'recents'

  constructor: ->
    super
    @profile ?= new Profile

    @html @profile.el

  activate: (params = {}) ->
    super

    type = if params.pageType? and params.pageType in @types then params.pageType else @defaultType
    @profile.turnPage type

class ProfilePage extends Stack
  className: "#{Stack::className} profile"

  controllers:
    profile: PlanetFourProfile

  routes:
    '/profile': 'profile'
    '/profile/:pageType': 'profile'

  default: 'profile'

module.exports = ProfilePage
