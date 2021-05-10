class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show    
  end

  def index
    @activities = current_user.activities.paginate(page: params[:page], per_page: 6)
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity), success: "Activity created successfully"
    else
      render 'new'
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, success: "Activity updated successfully"
    else
      render 'edit'
    end
  end

  def destroy 
    @activity.destroy
    redirect_to activities_path
  end

  private
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :name, :date, :distance, :duration, :repetitions, :avatar)
  end

  def require_same_user
    if current_user != @activity.user && !current_user.admin?
      redirect_to @activity, info: "You can only alter your own activities"
    end
  end

end