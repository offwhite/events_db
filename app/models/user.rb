class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events

  # disable email confirmation

  def confirmed?
    true
  end

  def send_on_create_confirmation_instructions
    false
  end

  def send_confirmation_notification?
    false
  end

  # Permission levels: 1: viewer, 2: editor, 3: administrator
  def admin?
    permission_level > 2
  end

  def can_edit?
    permission_level > 1
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  permission_level       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
