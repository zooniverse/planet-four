{Module, Events} = require 'spine'

class Mark extends Module
  @extend Events
  @include Events

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @

  set: (property, value, {fromMany} = {}) ->
    if typeof property is 'string'
      setter = @["set #{property}"]
      @[property] = if setter then setter.call @, value else value
    else
      map = property
      @set property, value, fromMany: true for property, value of map

    @trigger 'change' unless fromMany

  destroy: ->
    @trigger 'destroy'

module.exports = Mark
