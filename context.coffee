Section = require './section'

class Context
  constructor: (@students, @teachers, courses) ->
    @sections = {}

  generateSolutions: (callback, studentIdx = 0) ->
    if studentIdx is @students.length
      return false if not callback()

    student = @students[studentIdx]
    if student.isDone()
      return @generateSolutions callback, studentIdx + 1

    # place the current student into his/her courses
    for course in student.courses
      continue if student.isInCourse course
      # go through all the ways to assign the student to this course
      for i in [0...7]
        continue if student.sections[i]?
        # try to generate a new course here
        res = @_makeNew callback, student, studentIdx, course, i
        return false if not res
        res = @_joinExisting callback, student, studentIdx, course, i
        return false if not res
    return true

  _makeNew: (callback, student, studentIdx, course, block) ->
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
      return false if not res

      student.sections[block] = null
      teacher.sections[block] = null
      @sections[course.name].splice @sections[course.name].length - 1, 1
    return true

  _joinExisting: (callback, student, studentIdx, course, block) ->
    for sect in @sections[course.name] ? []
      sect.addStudent student
      res = @generateSolutions callback, studentIdx
      return false if not res
      sect.removeStudent student
    return true

if module?
  module.exports = Context