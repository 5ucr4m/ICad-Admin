class Role < ApplicationRecord
  include Sluggable

  belongs_to :role, optional: true
  belongs_to :app_module, class_name: 'GenericModel'

  has_many :actions, class_name: 'Role', dependent: :destroy
  has_many :user_roles, dependent: :destroy

  validates :name, :reference, presence: true

  ransack_alias :search, :id_to_s_or_name_or_description_or_url_or_reference
end
