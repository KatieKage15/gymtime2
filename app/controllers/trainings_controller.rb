class TrainingsController < ApplicationController

  def index
    @training = Training.all
  end

  def create
    @training = Training.create(user_id: current_user.id, instructor_id: params[:instructor_id], name: params[:instructor_training])
    redirect_to user_training_path(current_user)
  end

  def show
    @training = Instructor.training(@training_name)
  end

  def destroy
    @training = Training.find(params[:id])
    @training.delete
    redirect_to user_training_path
  end
end
