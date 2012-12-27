{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
pageTemplate = require 'views/profile_item_page'
itemTemplate = require 'views/profile_item'
translate = require 'lib/translate'
User = require 'zooniverse/lib/models/user'
Recent = require 'zooniverse/lib/models/recent'
Favorite = require 'zooniverse/lib/models/favorite'

class ProfileItemPage extends SubPage
  itemName: ''
  itemClass: null

  page: 1

  events:
    'click button[name="load-more"]': 'onClickLoadMore'

  elements:
    '.items': 'itemsList'

  constructor: ->
    super
    @html pageTemplate @
    User.bind 'sign-in', @onUserSignIn
    @itemClass.bind 'create', @onItemCreate

  onUserSignIn: =>
    @page = 1
    @itemsList.empty()

    if User.current?
      @itemClass.fetch()

  onItemCreate: (item) =>
    console.log 'Created', item.created_at, item
    $(itemTemplate item).appendTo @itemsList

  onClickLoadMore: ->
    @page += 1
    @itemClass.fetch {@page}

class ProfilePage extends Stack
  className: "#{Stack::className} profile-page"

  controllers:
    recents: class extends ProfileItemPage then itemName: 'recent', itemClass: Recent, content: 'TODO: Recents'
    favorites: class extends ProfileItemPage then itemName: 'favorite', itemClass: Favorite, content: 'TODO: Favorites'

  routes:
    '/profile/recents': 'recents'
    '/profile/favorites': 'favorites'

  default: 'recents'

module.exports = ProfilePage
