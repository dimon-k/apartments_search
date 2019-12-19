class AddLatitudeAndLongitudeToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :latitude, :decimal
    add_column :apartments, :longitude, :decimal
  end
end
