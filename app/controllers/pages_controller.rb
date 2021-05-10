class PagesController < ApplicationController
  def home
    redirect_to activities_path if logged_in?
  end

  def about
    redirect_to root_path, notice: "No about page found"
  end
  
end
