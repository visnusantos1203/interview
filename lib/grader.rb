# frozen_string_literal: true

require "csv"
require "student"

class Grader
  def initialize(file)
    @file = CSV.read(file, headers: true)
  def headers
    excluded_headers = %w[first_name last_name age]
    headers = @file.headers.reject { |header| excluded_headers.include?(header) }

    headers.unshift("Name")
    headers << "Average"

    headers.map(&:capitalize)
  end

  end
end
