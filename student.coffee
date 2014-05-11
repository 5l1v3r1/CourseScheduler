class Student
  constructor: (@name, @courses) ->
    @sections = (null for x in [0...7])
  
  isInCourse: (aCourse) ->
    for sect in @sections
      continue if not sect?
      return true if sect.course is aCourse
    return false
  
  isDone: ->
    for course in @courses
      return false if not @isInCourse course
    return true
  
  toString: -> "<Student name=#{@name} sections=#{@sections}>"

if module?
  module.exports = Student
