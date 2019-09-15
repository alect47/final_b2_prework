class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :course_id, :student_id
  validates_presence_of :grade
  validates :grade, numericality: { only_float: true,
                                        greater_than_or_equal_to: 0.0}
end
