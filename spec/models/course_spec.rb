require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many(:course_students)}
    it { should have_many(:students).through(:course_students)}
  end

  describe "instance methods" do
    before(:each) do
      @math = Course.create!(name: "Math")
      @science = Course.create!(name: "Science")
      @english = Course.create!(name: "English")

      @alec = Student.create!(name:"Alec")
      @luke = Student.create!(name:"Luke")
      @gus = Student.create!(name:"Gus")

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
