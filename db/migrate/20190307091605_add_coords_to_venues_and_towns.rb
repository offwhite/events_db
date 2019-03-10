class AddCoordsToVenuesAndTowns < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :latitude,  :float
    add_column :venues, :longitude, :float
    add_column :towns,  :latitude,  :float
    add_column :towns,  :longitude, :float

    add_column :events, :description, :text
    add_column :venues, :url,         :text
    add_column :venues, :phone,       :text

    add_column :venues,   :verified,  :boolean
    add_column :tours,    :verified,  :boolean
    add_column :events,   :verified,  :boolean
    add_column :roles,    :verified,  :boolean
    add_column :profiles, :verified,  :boolean
    add_column :profiles, :validated, :boolean

    add_column :role_types, :category, :text
    add_column :roles, :creator_id, :integer

    add_index :events, [:name, :date, :venue_id], unique: true
    add_index :roles, [:profile_id, :role_type_id, :event_id], unique: true
  end
end
