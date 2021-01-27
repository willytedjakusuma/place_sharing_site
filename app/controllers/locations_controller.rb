class LocationsController < ApplicationController

  def index
    @locations = Location.where("user_id = :user_id", user_id: current_user.id)
    @shared_locations = Location.where("shared_with @> '{\"data\": [:user_id]}'", user_id: current_user.id)
  end
  
  def new
    @location = Location.new
    @users = User.where("id != :current_user", current_user: current_user.id)
  end

  def create
    new_data = {}
    new_data[:shared_with] = { data: params[:location][:shared_with].reject {|friend| friend.empty? }.map {|friend_id| friend_id.to_i } }
    new_data[:latitude] = params[:location][:latitude].present? ? params[:location][:latitude].to_f : nil
    new_data[:longitude] = params[:location][:longitude].present? ? params[:location][:longitude].to_f : nil
    new_data[:is_private] = params[:location][:is_private] == "true" ? true : false
    new_data[:location_name] = params[:location][:location_name]
    new_data[:user_id] = current_user.id
    @location = Location.new(new_data)
    if @location.save
      redirect_to locations_path, :notice => "Your location has been shared"
    else
      flash[:alert] = "Something not quite right with your input"
      @users = User.where("id != :current_user", current_user: current_user.id)
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def location_params
    params.require(:location).permit(:location_name, :latitude, :longitude, :shared_with, :is_private)
  end
end
