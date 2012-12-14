{Module, Events} = require 'spine'

class Mark extends Module
  @extend Events
  @include Events

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @

  set: (property, value) ->
    if typeof property is 'string'
      @[property] = value
    else
      map = property
      @set property, value for property, value of map

    @trigger 'change'

  destroy: ->
    @trigger 'destroy'

module.exports = Mark
