class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user && user.authenticate(params[:session] [:password])
      session[:user_id] = user.id
      redirect_to user, success: "You have successfully logged in."
    else
      redirect_to login_path, danger: "Invalid password or email adress."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: "You have successfully logged out."
  end
  
end