# frozen_string_literal: true

require "grader"
require "terminal-table"

file = File.open("./files/grades.csv")
grader = Grader.new(file)

table = Terminal::Table.new do |t|
  t.headings = grader.headers
end

puts table
