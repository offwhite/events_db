class UpdateProfile < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :ordinal, :integer, default: 1
    add_column :profiles, :hometown, :text
    add_column :profiles, :pro_expires, :date
    add_column :profiles, :equipment_tags, :text

    add_column :users, :unsubscribed_at, :date
    add_index :profiles, [:equipment_tags]
  end
end
