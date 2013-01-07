{Module, Events} = require 'spine'
Api = require 'zooniverse/lib/api'
Recent = require 'zooniverse/lib/models/recent'
Favorite = require 'zooniverse/lib/models/favorite'

class Classification extends Module
  @extend Events
  @include Events

  subject: null
  started: 0
  agent: ''
  marks: null
  favorite: false

  constructor: (params = {}) ->
    @[propety] = value for own propety, value of params
    @started = (new Date).toUTCString()
    @agent = window.navigator.userAgent
    @marks = []

  toJSON: ->
    annotations = (mark.toJSON() for mark in @marks when not mark.destroyed).concat [{@started}, {@agent}]
    classification: {subject_ids: [@subject.id], annotations, @favorite}

  url: ->
    "/projects/planet_four/workflows/#{@subject.workflow_ids[0]}/classifications"

  send: ->
    unless @subject.metadata.tutorial or @subject.metadata.empty
      @constructor.sentThisSession += 1

    @trigger 'send'
    Api.post @url(), @toJSON(), arguments...

    recent = Recent.create subjects: @subject
    recent.trigger 'send'
    recent.trigger 'is-new'

    if @favorite
      favorite = Favorite.create subjects: @subject
      favorite.trigger 'send'
      favorite.trigger 'is-new'

module.exports = Classification
