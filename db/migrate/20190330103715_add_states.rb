class AddStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.text :name
      t.text :iso
      t.belongs_to :country
      t.timestamps
    end

    remove_column :towns, :state
    add_reference :towns, :state, index: true
  end
end
