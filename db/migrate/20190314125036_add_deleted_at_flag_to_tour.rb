class AddDeletedAtFlagToTour < ActiveRecord::Migration[5.1]
  def change
    add_column :tours,       :deleted_at, :date
    add_column :event_types, :deleted_at, :date
    add_column :role_departments, :deleted_at, :date
    add_column :role_types,  :deleted_at, :date
    add_column :towns,       :deleted_at, :date
    remove_column :roles, :role_department_id
  end
end
