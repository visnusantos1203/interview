# frozen_string_literal: true

require "csv"
require "student"

class Grader
  DEFAULT_EXCLUDED_HEADERS = %w[first_name last_name age].freeze

  def initialize(file)
    @file = CSV.read(file, headers: true)
  end

  def average(student)
    row = find_student_row(student)
    return nil unless row
    
    subjects = %w[english math physics] 
    subjects.sum { |subject| row[subject].to_i } / subjects.length
  end

  def get_grade(student, subject)
    row = find_student_row(student)
    row&.[](subject)
  end

  def headers
    headers = @file.headers.reject { |header| DEFAULT_EXCLUDED_HEADERS.include?(header) }

    headers.unshift("Name")
    headers << "Average"

    headers.map(&:capitalize)
  end

  def students
    @students ||= @file.map do |row|
      Student.new(row["first_name"], row["last_name"], row["age"])
    end
  end

  def subject_headers
    @subject_headers ||= @file.headers.reject { |header| DEFAULT_EXCLUDED_HEADERS.include?(header) }
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
