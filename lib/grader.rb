# frozen_string_literal: true

require "csv"
require "student"

class Grader
  def initialize(file)
    @file = CSV.read(file, headers: true)
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

  end
end
