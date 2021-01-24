require 'rails_helper'

RSpec.describe DashboardController, type: :controller do 
  login_user

  describe "GET index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      # expect(response).to have_http_status(302)
    end
  end
end