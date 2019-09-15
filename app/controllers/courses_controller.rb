class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
    @ordered_course_students = @course.ordered_course_students
    # binding.pry
  end

  def index
  end

  def new
  end

  def create
  end

private

  def course_params
    params.permit(:name)
  end

end
