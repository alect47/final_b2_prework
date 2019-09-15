class Student < ApplicationRecord
  has_many :course_students
  has_many :courses, through: :course_students
  validates_presence_of :name

  def grade_for_course(course_id)
    course_students.where(course_id: course_id).pluck(:grade)
  end
end
