class AddOrdinalToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :ordinal, :integer, default: 0
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :phone, :text
    add_column :profiles, :url, :text
    add_column :profiles, :merged_id, :integer
    add_reference :role_types, :role_department, index: true
  end
end
