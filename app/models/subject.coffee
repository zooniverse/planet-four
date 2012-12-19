{Model} = require 'spine'
$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'

class Subject extends Model
  @configure 'Subject zooniverse_id workflow_ids location coords metadata'.split ' '

  @queueLength: 5

  @current: null

  @url: ->
    '/projects/serengeti/groups/subjects'

  @next: =>
    @current?.destroy()

    nexter = new $.Deferred
    nexter.then arguments...

    if @count() is 0
      @fetch().always =>
        @first()?.select()
        if @current
          nexter.resolve @current
        else
          nexter.reject arguments...

    else
      @first().select()
      nexter.resolve @current
      @fetch() if @count() < @queueLength

    nexter.promise()

  @fetch: (number) =>
    number ?= @queueLength - @count()

    fetcher = new $.Deferred

    request = new $.Deferred
    mockResponse = ({zooniverse_id: i} for i in [0...number])
    setTimeout (=> request.resolve mockResponse), 1000

    request.done (rawSubjects) =>
      try
        subject.save() for subject in @fromJSON rawSubjects
        fetcher.resolve @all()
      catch e
        fetcher.reject arguments...

    fetcher.promise()

  @fromJSON: (objects) =>
    instances = super
    instances = [instances] unless instances instanceof Array

    for instance in instances when instance.location?.standard
      standardImage = instance.location.standard
      standardImage = [standardImage] unless standardImage instanceof Array

      (new Image).src = src for src in standardImage

    instances

  select: ->
    @constructor.current = @
    @trigger 'select'

module.exports = Subject
window.Subject = Subject
