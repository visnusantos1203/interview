RSpec.describe Grader do
  let(:file) { File.open("./files/grades.csv") }
  let(:grader) { Grader.new(file) }
  let(:student) { Student.new("Billy", "Joel", 20) }

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


  it "should return the grade for a specific subject" do
    expect(grader.get_grade(student, "english")).to eq("92")
    expect(grader.get_grade(student, "math")).to eq("88")
    expect(grader.get_grade(student, "physics")).to eq("85")
  end

  it "should return the students" do
    expect(grader.students).to be_an(Array)
    expect(grader.students.first).to be_a(Student)
    expect(grader.students.first.first_name).to eq("Billy")
    expect(grader.students.first.last_name).to eq("Joel")
    expect(grader.students.first.age).to eq("14")
  end
end
