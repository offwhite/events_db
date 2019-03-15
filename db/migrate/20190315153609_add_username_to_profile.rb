class AddUsernameToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :username, :text

    add_index :profiles, :username, unique: true
  end
end
