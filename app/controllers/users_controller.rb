class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin_user, only: [:index]
    
    def show
        @activities = @user.activities.paginate(page: params[:page], per_page: 6) 
    end

    def new
      @user = User.new
    end

    def index
      @users = User.paginate(page: params[:page], per_page: 6)
    end

    def edit  
    end

    def update
      if @user.update(user_params)
        redirect_to @user, success: "Your informations have been updated."
      else
        render 'edit'
      end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to activities_path, success: "Welcome #{@user.username}, you have successfully signed up!"
      else
        render 'new'
      end
    end

    def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all activities successfully deleted"
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :bio, :avatar, :gender)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only alter your own profile"
        redirect_to @user
      end
    end

    def require_admin_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "Access reserved to admin users"
        redirect_to current_user
      end
    end
    
end