RSpec.describe Student do
  let (:student) { Student.new("John", "Doe", 20) }

  describe "#initialize" do
    it "should initialize with first name, last name, and age" do
      expect(student.first_name).to eq("John")
      expect(student.last_name).to eq("Doe")
      expect(student.age).to eq(20)
    end
  end

  describe "#full_name" do
    it "should return the full name" do
      expect(student.full_name).to eq("John Doe")
    end
  end
end
