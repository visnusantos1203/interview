RSpec.describe Grader do
  let(:file) { File.open("./files/grades.csv") }
  let(:grader) { Grader.new(file) }

  describe "#initialize" do
    it "should read the CSV file" do
      expect(grader.instance_variable_get(:@file)).not_to be_nil
      expect(grader.instance_variable_get(:@file).headers).to include("first_name", "last_name", "age", "english", "math", "physics")
    end
  end

  describe "headers" do
    it "should have filtered headers" do
      expect(grader.headers).to include("Name", "English", "Math", "Physics", "Average")
      expect(grader.headers).not_to include("first_name", "last_name", "age")
    end
  end
  end
end
