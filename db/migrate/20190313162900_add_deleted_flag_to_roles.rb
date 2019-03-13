class AddDeletedFlagToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :deleted_at, :date
    add_column :events, :deleted_at, :date
    add_column :venues, :deleted_at, :date
    add_column :profiles, :deleted_at, :date
    add_column :users, :banned_at, :date
  end
end
