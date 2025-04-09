# frozen_string_literal: true

require "csv"
require "student"

class Grader
  def initialize(file)
    @file = CSV.read(file, headers: true)
  end


  def get_grade(student, subject)
    row = find_student_row(student)
    row&.[](subject)
  end
  def headers
    excluded_headers = %w[first_name last_name age]
    headers = @file.headers.reject { |header| excluded_headers.include?(header) }

    headers.unshift("Name")
    headers << "Average"

    headers.map(&:capitalize)
  end

  def students
    # puts "Creating students..."
    @students ||= @file.map do |row|
      Student.new(row["first_name"], row["last_name"], row["age"])
    end
  end

  private

  def find_student_row(student)
    students_grades.find do |row|
      row["first_name"] == student.first_name && row["last_name"] == student.last_name
    end
  end
  
  def students_grades
    @students_grades ||= @file.map { |row| row.to_h }
  end
end
