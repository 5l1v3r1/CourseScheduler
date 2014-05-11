class Teacher
  constructor: (@name, @courses, @maxSect) ->
    @sections = (null for i in [0...7])
  
  isBusy: ->
    count = 0
    for x in @sections
      count++ if x?
    return count >= @maxSect

if module.exports?
  module.exports = Teacher
