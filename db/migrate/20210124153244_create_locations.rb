class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.float :latitude
      t.float :longitude
      t.boolean :is_private
      t.jsonb :shared_with
      
      t.timestamps
    end
  end
end
