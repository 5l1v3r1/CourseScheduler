# Course Scheduler

So let's say you're a high school--something like my high school. You have a bunch of students enrolled, and they're all taking classes they've signed up for. Furthermore, you have a handful of teachers with varying skill levels in various subjects.

The problem becomes: how do you fit everyone into classes? If Jimmy and James are both taking Calculus, but they are taking different Art classes, and one of those art classes needs to happen during the time for Calculus class, what ever can you do?

### Assumptions

This project will be a simple API that allows you to generate your school's schedule in a jiffy. It assumes that your school is on a 7 block system. that means that there are 7 separate "blocks" for classes. Block 1 classes meet at one time during the day, Block 2 another, etc. The important thing to note is that a student may *never* be scheduled in two different places during one block. Besides that there are no restrictions.

Block 7 is special, so certain science teachers may request that their classes meet during Block 7 to get extra lab time. This is an option on a per-course basis, but not a per-teacher or per-student basis.

# Language Choice

Right now, I'm using CoffeeScript because it's good for throwing something together and seeing if it works. Once I have this working, I am probably going to switch to C++ for the performance boost. Additionally, the algorithm I am currently using is recursive. This is a problem in JavaScript where you cannot allocate your own stack. If I rewrite this in C++, I will certainly allocate my own stack so that huge depths of recursion can be obtained (yay h4x0ring).
