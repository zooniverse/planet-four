Subject = require 'zooniverse/models/subject'
Api = require 'zooniverse/lib/api'
{ Route } = require 'spine'

# Something like this should probably be in zoolib
class SubjectSelector
  constructor: ->
    addEventListener 'hashchange', @onHashChange, false
    @onHashChange()

  onHashChange: ->
    cleanHash = location.hash.match(/([\w]+[\w\/]+)/gi)
    pieces = cleanHash?.pop().split('/')
    return unless pieces?[0] is 'subjects'

    Api.current.get "projects/#{ Api.current.project }/subjects/#{ pieces[1] }", (rawSubject) ->
      return unless rawSubject
      subject = new Subject rawSubject
      subject.select()

      Route.navigate '#/classify'

module.exports = SubjectSelector
