class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  
  def show    
  end

  def index
    @activities = Activity.all 
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = User.first
    if @activity.save
      flash[:notice] = "Activity created successfully"
      redirect_to activity_path(@activity)
    else
      render 'new'
    end
  end

  def update
    if @activity.update(activity_params)
      flash[:notice] = "Activity updated successfully"
      redirect_to @activity
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
    params.require(:activity).permit(:title, :description)
  end

end