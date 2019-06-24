class TrainingsController < ApplicationController

  def index
    if params[:training]
      methods = params[:training][:methods]
      @training = Training.send_chain(methods)
    else
      @training = Training.all
    end
  end

  #   if current_user
  #     @training_time = Training.name
  #     @training = Training.all
  #     @user_id = current_user.id
  #   else
  #     flash[:error] = "You need to sign up for a training instructor before you can view your booked sessions."
  #     redirect_to root_url
  #   end
  # end

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

  private

  def find_training
    @training = Training.find_by(id: params[:id])
  end

  def training_params
    params.require(:training).permit(:name, :day_time)
  end
end
