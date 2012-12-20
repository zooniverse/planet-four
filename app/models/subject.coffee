{Model} = require 'spine'
$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'

class Subject extends Model
  @configure 'Subject', 'zooniverse_id', 'workflow_ids', 'location', 'coords', 'metadata'

  @queueLength: 5

  @current: null

  @url: ->
    # TODO
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

    request = Api.get(@url(), limit: number).deferred
    request.done (rawSubjects) =>
      window.response = rawSubjects
      try
        subject.save() for subject in @fromJSON rawSubjects
        fetcher.resolve @all()
      catch e
        fetcher.reject arguments...

    fetcher.promise()

  @fromJSON: (objects) =>
    instances = super
    instanceList = instances
    instanceList = [instanceList] unless instanceList instanceof Array

    for instance in instanceList when instance.location?.standard
      standardImage = instance.location.standard
      standardImage = [standardImage] unless standardImage instanceof Array

      (new Image).src = src for src in standardImage

    instances

  @selectTutorial: =>
    # TODO
    @create(metadata: tutorial: true).select()

  select: ->
    @constructor.current = @

module.exports = Subject
window.Subject = Subject unless +location.port < 1024
