require 'rails_helper'

describe 'When user visits student show page' do
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

  it 'they see student info' do
    visit "/students/#{@alec.id}"
    expect(page).to have_content("Student name: #{@alec.name}")

    within ".courses" do
      expect(page).to have_content("#{@math.name}: 87.0")
      expect(page).to have_content("#{@science.name}: 81.0")
      expect(page).to_not have_content(@english.name)
    end
  end

  it 'they see student info' do
    visit "/students/#{@luke.id}"
    expect(page).to have_content("Student name: #{@luke.name}")
    within ".courses" do
      expect(page).to have_content("#{@english.name}: 91.0")
      expect(page).to have_content("#{@science.name}: 94.0")
      expect(page).to_not have_content(@math.name)
    end
  end
end
