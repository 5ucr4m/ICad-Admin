# frozen_string_literal: true
class UserRole < ApplicationRecord
  include Sluggable

  belongs_to :company
  belongs_to :user
  belongs_to :role

  ransack_alias :search, :id_to_s

  enum current_module: { administrative: 0, service: 1 }

  validates :role_id, uniqueness: { scope: %i[company_id role_id] }

  def on_administrative?
    administrative?
  end

  def on_service?
    service?
  end
end
