Api = require 'zooniverse/lib/api'

class Classification
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
    {subject_ids: [@subject.id], annotations, @favorite}

  send: ->
    console?.info 'Saving classification', @toJSON()
    window.lastClassification = @toJSON()

module.exports = Classification
