# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  belongs_to :role, optional: true
  belongs_to :app_module, class_name: 'GenericModel', optional: true

  has_many :actions, class_name: 'Role', dependent: :destroy
  has_many :user_roles, dependent: :destroy

  validates :name, :model_reference, :url_reference, presence: true

  ransack_alias :search, :id_to_s_or_name_or_description_or_url_reference_or_model_reference_or_action_reference

  def name_formatted
    "#{name} - #{action_reference}"
  end
end
