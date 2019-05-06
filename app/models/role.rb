# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id            :bigint           not null, primary key
#  description   :string
#  icon          :string
#  name          :string
#  reference     :string
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  app_module_id :bigint
#  role_id       :bigint
#
# Indexes
#
#  index_roles_on_app_module_id  (app_module_id)
#  index_roles_on_role_id        (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (app_module_id => generic_models.id)
#  fk_rails_...  (role_id => roles.id)
#

class Role < ApplicationRecord
  include Sluggable

  belongs_to :role, optional: true
  belongs_to :app_module, class_name: 'GenericModel'

  has_many :actions, class_name: 'Role', dependent: :destroy
  has_many :user_roles, dependent: :destroy

  ransack_alias :search, :id_to_s
end
