{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
pageTemplate = require 'views/profile_item_page'
itemTemplate = require 'views/profile_item'
translate = require 'translate'
User = require 'zooniverse/lib/models/user'
Recent = require 'zooniverse/lib/models/recent'
Favorite = require 'zooniverse/lib/models/favorite'

class ProfileItemPage extends SubPage
  itemName: ''
  itemClass: null

  page: 1

  events:
    'click button[name="add-favorite"]': 'onClickAddFavorite'
    'click button[name="remove-favorite"]': 'onClickRemoveFavorite'
    'click button[name="load-more"]': 'onClickLoadMore'

  elements:
    '.items': 'itemsList'

  constructor: ->
    super

    @html pageTemplate @

    User.bind 'sign-in', @onUserSignIn

    @itemClass.bind 'create', @onItemCreate
    @itemClass.bind 'mark-new', @onItemMarkNew
    @itemClass.bind 'destroy', @onItemDestroy

  onUserSignIn: =>
    @page = 1
    @itemsList.empty()

    if User.current?
      @itemClass.fetch()

  onItemCreate: (item) =>
    return if item.subjects.length is 0
    itemElement = $(itemTemplate item)
    itemElement.attr 'data-item': item.id
    itemElement.appendTo @itemsList
    item.bind 'change', => itemElement.attr 'data-item': item.id

  onItemMarkNew: (item) =>
    element = @itemsList.find "[data-item='#{item.id}']"
    element.prependTo @itemsList
    element.addClass 'new'

  onItemDestroy: (item) =>
    @itemsList.find("[data-item='#{item.id}']").remove()

  onClickAddFavorite: ({target}) ->
    target = $(target)
    item = @itemClass.find target.val()

    attributes = {}
    attributes[name] = item[name] for name in Favorite.attributes

    favorite = Favorite.create attributes
    favorite.trigger 'mark-new'
    favorite.send() # TODO: This doesn't work.
    target.attr disabled: true

  onClickRemoveFavorite: ({target}) ->
    favorite = Favorite.find $(target).val()
    favorite.unfavorite()

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
