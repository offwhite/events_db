class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.text :action
      t.references :record, polymorphic: true
      t.belongs_to :user
      t.json :change_values
      t.timestamps
    end
    add_index :logs, [:record_id, :user_id]
  end
end
