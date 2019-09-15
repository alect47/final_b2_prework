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
      @alec = Student.create!(name:"Alec")
      @luke = Student.create!(name:"Luke")
      @gus = Student.create!(name:"Gus")
      @avery = Student.create!(name:"Avery")

      @math = Course.create!(name: "Math")
      @science = Course.create!(name: "Science")
      @course_student_1 = CourseStudent.create!(course_id: @math.id, student_id: @luke.id, grade: 64.0)
      @course_student_4 = CourseStudent.create!(course_id: @math.id, student_id: @avery.id, grade: 94.0)
      @course_student_3 = CourseStudent.create!(course_id: @math.id, student_id: @gus.id, grade: 82.0)
      @course_student_2 = CourseStudent.create!(course_id: @math.id, student_id: @alec.id, grade: 74.0)
      @course_student_5 = CourseStudent.create!(course_id: @science.id, student_id: @luke.id, grade: 14.0)
      @course_student_6 = CourseStudent.create!(course_id: @science.id, student_id: @avery.id, grade: 74.0)
      @course_student_7 = CourseStudent.create!(course_id: @science.id, student_id: @gus.id, grade: 87.0)
      @course_student_8 = CourseStudent.create!(course_id: @science.id, student_id: @alec.id, grade: 73.0)
    end
    it 'ordered_course_students' do
      expect(@math.course_students).to eq([@course_student_1, @course_student_4, @course_student_3, @course_student_2])
      expect(@math.ordered_course_students).to eq([@course_student_4, @course_student_3, @course_student_2, @course_student_1])
    end
  end
end
