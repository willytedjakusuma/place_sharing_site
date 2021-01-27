class UsersController < ApplicationController
  def index
    @users = User.where("id != :current_user", current_user: current_user.id )
  end

  def show
    @user = User.find_by_username(params[:username])
    @current_user_location = Location.where(user_id: @user.id, is_private: false)
  end
end
