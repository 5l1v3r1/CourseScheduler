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
  
  toString: -> "<Course block=#{@block} teacher=#{@teacher} course=#{@course}>"

if module?
  module.exports = Section
