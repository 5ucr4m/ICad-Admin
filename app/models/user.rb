# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable

  include DeviseTokenAuth::Concerns::User

  ransacker :id_to_s do
    Arel.sql("regexp_replace(to_char(\"#{table_name}\".\"id\", '9999999'), ' ', '', 'g')")
  end

  ransack_alias :search, :id_to_s

  def send_confirmation_notification?
    skip_confirmation!
    false
  end
end
