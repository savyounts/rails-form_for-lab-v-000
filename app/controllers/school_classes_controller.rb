class SchoolClassController < ApplicationController

  def index
    @classes = SchoolClass.all
  end

  def new
  end

  def create
    @class = SchoolClass.create(class_params(:title, :room_number))
    redirect to class_path(@class)
  end

  def edit
    set_class
  end

  def update
    set_class
    @class.update(class_params(:title, :room_number))
    redirect_to class_path(@class)
  end

  def show
    set_class
  end

  private
    def set_class
      @class = SchoolClass.find(params[:id])
    end

    def class_params(*args)
      params.require(:student).permit(*args)
    end

end