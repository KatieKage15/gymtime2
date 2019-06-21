class InstructorsController < ApplicationController

  before_action :find_instructor, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

  def index
    if params[:instructor]
      methods = params[:instructor][:methods]
      @instructor = Instructor.send_chain(methods)
    else
      @instructor = Instructor.all
    end
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create(instructor_params)
    if @instructor.save
      redirect_to instructor_path
    else
      render 'new'
    end
  end

  def show
    @instructor= Instructor.find(params[:id])
    Instructor.specialty(params[:name])
  end

  def edit
  end

  def update
    @instructor.update(instructor_params)
    if @instructor.save
      redirect_to instructor_path(@instructor)
    else
      render :edit
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors_path
  end

  private

  def find_instructor
    @instructor = Instructor.find_by(id: params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :gym, :specialty)
  end
end
