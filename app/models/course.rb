class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students
  validates_presence_of :name

  def ordered_course_students
    course_students.order(grade: :desc)
  end
end
