Section = require './section'

class Context
  constructor: (@students, @teachers, courses) ->
    @sections = {}
    @funcDepth = 0

  generateSolutions: (callback, studentIdx = 0) ->
    @funcDepth++
    
    if studentIdx is @students.length
      return @_return false if not callback()
      return @_return true

    student = @students[studentIdx]
    if student.isDone()
      return @_return @generateSolutions callback, studentIdx + 1

    # place the current student into his/her courses
    for course in student.courses
      continue if student.isInCourse course
      # go through all the ways to assign the student to this course
      for i in [0...7]
        continue if student.sections[i]?
        # try to generate a new course here
        res = @_makeNew callback, student, studentIdx, course, i
        return @_return false if not res
        res = @_joinExisting callback, student, studentIdx, course, i
        return @_return false if not res
    return @_return true

  _makeNew: (callback, student, studentIdx, course, block) ->
    @funcDepth++
    for teacher in @teachers
      continue if 0 > teacher.courses.indexOf course
      continue if teacher.sections[block]?
      continue if teacher.isBusy()

      sect = new Section course, block, teacher
      sect.addStudent student

      if not @sections[course.name]?
        @sections[course.name] = []
      @sections[course.name].push sect

      res = @generateSolutions callback, studentIdx
      return @_return false if not res

      student.sections[block] = null
      teacher.sections[block] = null
      @sections[course.name].splice @sections[course.name].length - 1, 1
    return @_return true

  _joinExisting: (callback, student, studentIdx, course, block) ->
    @funcDepth++
    for sect in @sections[course.name] ? []
      continue if sect.block isnt block
      sect.addStudent student
      res = @generateSolutions callback, studentIdx
      return @_return false if not res
      sect.removeStudent student
    return @_return true
  
  _return: (x) ->
    @funcDepth--
    return x

if module?
  module.exports = Context