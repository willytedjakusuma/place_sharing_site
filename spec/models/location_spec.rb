require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:each) do
    @user = create(:user)
  end
  
  context 'validation tests' do
    it 'ensures location name presence' do
      location = Location.new(latitude: 0.0, longitude: 0.0, is_private: false, user_id: @user.id).save
      expect(location).to eq(false)
    end
    
    it 'ensures latitude and longitude presence' do
      location = Location.new(location_name: "Some places", is_private: false, user_id: @user.id).save
      expect(location).to eq(false)
    end
    
    it 'ensures related to users' do
      location = Location.new(location_name: "Some places", latitude: 0.0, longitude: 0.0, is_private: false).save
      expect(location).to eq(false)
    end
    
    it 'ensures privacy status presences' do
      location = Location.new(latitude: 0.0, longitude: 0.0, is_private: false, user_id: @user.id).save
      expect(location).to eq(false)
    end
  end

end
