class Course
  constructor: (@name, @idealSize = 15, @blockReq = false) ->
  
  toString: -> @name

if module?
  module.exports = Course
