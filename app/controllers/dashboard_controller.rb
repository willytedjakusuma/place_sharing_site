class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @locations = Location.where("user_id = :user_id", user_id: current_user.id)
    @shared_locations = Location.where("shared_with @> '{\"data\": [:user_id]}'", user_id: current_user.id)
  end
end
