class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def index
  end

  def new
  end

  def create
  end

private

  def student_params
    params.permit(:name)
  end

end
