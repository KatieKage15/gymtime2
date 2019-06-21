class TrainingsController < ApplicationController

  def index
    if current_user.specialty !=[]
      @user_training = current_user.training
      @training = training.all
      @user_id = current_user.id
    else
      flash[:error] = "You need to pick a training session before you can choose an instructor."
      redirect_to root_url
    end
  end

  def create
    @training = Training.create(user_id: current_user.id, instructor_id: params[:instructor_id], name: params[:instructor_training])
    redirect_to user_training_path(current_user)
  end

  def show
    @training_name = specialty_path.slice(10...)
    @training_tutors = Instructor.training(@training_name)
  end

  def destroy
    @training = Training.find(params[:id])
    @training.delete
    redirect_to user_training_path
  end
end
