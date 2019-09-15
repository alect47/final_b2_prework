require 'rails_helper'

describe CourseStudent, type: :model do
  describe "validations" do
    it { should validate_presence_of :course_id}
    it { should validate_presence_of :student_id }
    it { should validate_numericality_of :grade}
  end

  describe "relationships" do
    it { should belong_to :course}
    it { should belong_to :student}
  end

  describe "instance methods" do
    before(:each) do
      @alec = Student.create!(name:"Alec")
      @luke = Student.create!(name:"Luke")
      @gus = Student.create!(name:"Gus")

      @math = Course.create!(name: "Math")
      @science = Course.create!(name: "Science")
      @english = Course.create!(name: "English")

      # @math.students << [@alec, @luke, @gus]
      @math.students << @alec
      @math.students << @luke
      @math.students << @gus
      @alec.courses << @science
      @alec.courses << @english
      @luke.courses << @science
      @luke.courses << @english
      @gus.courses << @science
      @gus.courses << @english
    end
  end
end
