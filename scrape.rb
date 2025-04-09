# frozen_string_literal: true

require "grader"
require "terminal-table"

file = File.open("./files/grades.csv")
grader = Grader.new(file)

table = Terminal::Table.new do |t|
  t.headings = grader.headers
  
  grader.students.each do |student|
    row = [student.full_name]

    grader.subject_headers.each do |subject|
      row << grader.get_grade(student, subject)
    end
    
    row << grader.average(student)

    t.add_row(row)
    t.add_separator unless student == grader.students.last
  end
end

puts table
