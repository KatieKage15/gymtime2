class TrainingsController < ApplicationController

  def index
    if current_user.trainings !=[]
      @user_trainings = current_user.trainings
      @training = Training.all
      @user_id = current_user.id
    else
      flash[:error] = "You need to sign up for a training instructor before you can view your booked sessions."
      redirect_to root_url
    end
  end

  def create
    @training = Training.create(user_id: current_user.id, instructor_id: params[:instructor_id], name: params[:instructor_training])
    redirect_to user_training_path(current_user)
  end

  def show
    @training_name = training_path.slice(10...)
    @training_instructor = Instructor.training(@training_name)
  end

  def destroy
    @training = Training.find(params[:id])
    @training.delete
    redirect_to user_training_path
  end
end
