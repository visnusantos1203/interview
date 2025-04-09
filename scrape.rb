# frozen_string_literal: true

require "grader"
require "terminal-table"

file = File.open("./files/grades.csv")
grader = Grader.new(file)

table = Terminal::Table.new do |t|
  t.headings = grader.headers
  
  grader.students.each do |student|
    t.add_row([ student.full_name,
                grader.get_grade(student, "english"),
                grader.get_grade(student, "math"),
                grader.get_grade(student, "physics") ])
  
    t.add_separator unless student == grader.students.last
  end
end

puts table
