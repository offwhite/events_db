class CreateCountryTownVenueTourEventRoleRoletypeProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.integer  :permission_level

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :countries do |t|
      t.text :name
      t.text :iso
      t.text :language
      t.timestamps
    end

    create_table :towns do |t|
      t.text :name
      t.text :description
      t.belongs_to :country
      t.timestamps
    end

    create_table :venues do |t|
      t.text :name
      t.text :description
      t.text :address
      t.belongs_to :town
      t.integer :capacity
      t.timestamps
    end

    create_table :tour do |t|
      t.text :name
      t.belongs_to :tour_type
      t.belongs_to :user
      t.timestamps
    end

    create_table :tour_type do |t|
      t.text :name
      t.timestamps
    end

    create_table :event do |t|
      t.text :name
      t.date :date
      t.belongs_to :event_type
      t.belongs_to :venue
      t.belongs_to :tour, null: true
      t.belongs_to :user
      t.timestamps
    end

    create_table :event_type do |t|
      t.text :name
      t.timestamps
    end

    create_table :role do |t|
      t.belongs_to :profile
      t.belongs_to :event
      t.belongs_to :role_type
      t.timestamps
    end

    create_table :role_type do |t|
      t.text :name
      t.text :description
      t.timestamps
    end

    create_table :profile do |t|
      t.text :name
      t.text :biography
      t.belongs_to :user, null: true
      t.timestamps
    end
  end
end
