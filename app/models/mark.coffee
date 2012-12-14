{Module, Events} = require 'spine'

class Mark extends Module
  @extend Events
  @include Events

  points: null

  constructor: (params = {}) ->
    @[property] = value for own property, value of params when property of @

    @points ?= {}

  change: (changes = {}) ->
    @points[property] = value for own property, value of changes
    @trigger 'change'

  toJSON: ->
    JSON.stringify @points

  destroy: ->
    @trigger 'destroy'

module.exports = Mark
