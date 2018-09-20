class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
  end

  def create
    @student= Student.create(student_params(:first_name, :last_name))
    redirect to student_path(@student)
  end

  def edit
    set_student
  end

  def update
    set_student
    @student.update(student_params(:first_name, :last_name))
    redirect_to student_path(@student
  end

  def show
    set_student
  end

  private
    def set_class
      @student = Student.find(params[:id])
    end

    def class_params(*args)
      params.require(:student).permit(*args)
    end

end
