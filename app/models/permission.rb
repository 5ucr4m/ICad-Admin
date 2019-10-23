# frozen_string_literal: true

class Permission < ApplicationRecord
  include Sluggable

  belongs_to :app_module, class_name: 'GenericModel', optional: true

  has_many :role_permissions

  ransack_alias :search, :id_to_s

  scope :by_app_module, ->(app_module) { where(app_module: app_module) }
end
