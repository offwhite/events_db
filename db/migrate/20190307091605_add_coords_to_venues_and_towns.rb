class AddCoordsToVenuesAndTowns < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
    add_column :towns, :latitude, :float
    add_column :towns, :longitude, :float

    add_column :events, :description, :text
    add_column :venues, :url, :text
    add_column :venues, :phone, :text
  end
end
