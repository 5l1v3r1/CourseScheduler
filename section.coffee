class Section
  constructor: (@course, @block, @teacher, @students = []) ->
    @teacher.sections[@block] = @
  
  addStudent: (student) ->
    student.sections[@block] = @
    @students.push student
  
  removeStudent: (student) ->
    student.sections[@block] = null
    idx = @students.indexOf student
    @students.splice idx, 1 if idx >= 0

if module.exports?
  module.exports = Section
