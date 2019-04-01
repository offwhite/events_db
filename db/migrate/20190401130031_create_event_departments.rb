class CreateEventDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :event_departments do |t|
      t.text :name
      t.text :description
      t.datetime :deleted_at
      t.timestamps
    end

    add_reference :event_types, :event_department, index: true
    add_column :event_types, :description, :text
  end
end
