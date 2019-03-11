class AddTourToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :tour_id,  :integer
    add_column :roles, :role_department_id,  :integer

    create_table :role_departments do |t|
      t.text :name
      t.text :description
      t.timestamps
    end
  end
end
