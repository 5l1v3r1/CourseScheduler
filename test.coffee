Context = require './context'
Course = require './course'
Student = require './student'
Teacher = require './teacher'

courses = [
  new Course('Chem I')
  new Course('Chem II')
  new Course('Calc I')
  new Course('Calc II')     # 3
  new Course('Latin I')
  new Course('Latin II')
  new Course('Latin III')
  new Course('Latin IV')    # 7
  new Course('Lit I')
  new Course('Lit II')
  new Course('Lit III')
  new Course('Lit IV')      # 11
]

students = [
  new Student('Alex', [courses[1], courses[3], courses[7], courses[10]])
  new Student('Dan', [courses[1], courses[3], courses[7], courses[10]])
  new Student('John', [courses[1], courses[7], courses[10]])
  new Student('Odette', [courses[2], courses[10]])
]

teachers = [
  new Teacher('Hanson', [courses[0], courses[1]])
  new Teacher('Plunkett', [courses[3]])
  new Teacher('Doc', [courses[4], courses[5], courses[6], courses[7]])
  new Teacher('Mr. V', [courses[8]])
  new Teacher('Kelleher', [courses[9], courses[11]])
  new Teacher('Perez', [courses[10]])
]

ctx = new Context students, teachers, courses
ctx.generateSolutions ->
  console.log 'got solution'
