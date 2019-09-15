class Student < ApplicationRecord
  has_many :course_students
  has_many :courses, through: :course_students
  validates_presence_of :name

  #seems to work just with AR course, no need for id?
  def grade_for_course(course)
    course_students.where(course_id: course).pluck(:grade)
  end
end
