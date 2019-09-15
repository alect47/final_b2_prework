require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many(:course_students)}
    it { should have_many(:courses).through(:course_students)}
  end

  describe "instance methods" do
    before(:each) do
      @alec = Student.create!(name:"Alec")
      @luke = Student.create!(name:"Luke")

      @math = Course.create!(name: "Math")
      @science = Course.create!(name: "Science")
      @english = Course.create!(name: "English")

      @course_student_1 = CourseStudent.create!(course_id: @math.id, student_id: @alec.id, grade: 87.0)
      @course_student_2 = CourseStudent.create!(course_id: @science.id, student_id: @alec.id, grade: 81.0)
      @course_student_3 = CourseStudent.create!(course_id: @english.id, student_id: @luke.id, grade: 91.0)
      @course_student_4 = CourseStudent.create!(course_id: @science.id, student_id: @luke.id, grade: 94.0)
    end

    it 'grade_for_course' do
      expect(@alec.grade_for_course(@math)).to eq(87.0)
      expect(@alec.grade_for_course(@science)).to eq(81.0)
      expect(@luke.grade_for_course(@english)).to eq(91.0)
      expect(@luke.grade_for_course(@science)).to eq(94.0)
    end
  end
end
