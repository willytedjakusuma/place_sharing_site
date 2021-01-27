class Location < ApplicationRecord
  validates :location_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  # validates :is_private, presence: true
end
