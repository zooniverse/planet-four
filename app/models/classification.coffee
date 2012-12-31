Api = require 'zooniverse/lib/api'

class Classification
  started: 0
  agent: ''
  marks: null

  constructor: ->
    @started = (new Date).toUTCString()
    @agent = window.navigator.userAgent
    @marks = []

  toJSON: ->
    annotations: (mark.toJSON() for mark in @marks when not mark.destroyed).concat [{@started}, {@agent}]

  send: ->
    console?.info 'Saving classification', @toJSON()

module.exports = Classification
