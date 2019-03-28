class AddSlugToVenues < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :hometown
    add_column :profiles, :hometown_id, :bigint
    add_column :venues, :slug, :text
    add_column :towns, :state, :text
  end
end
