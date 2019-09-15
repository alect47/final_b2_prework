require 'rails_helper'

describe 'When user visits course show page' do
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

  it 'they see course info' do
    visit "/courses/#{@math.id}"
    expect(page).to have_content(@math.name)
    within ".students" do
      expect(page).to have_content(@avery.name)
      expect(page).to have_content(@gus.name)
      expect(page).to have_content(@alec.name)
      expect(page).to have_content(@luke.name)
    end
  end
end
