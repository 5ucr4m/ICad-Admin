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

class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon, :reference, :slug
  has_one :role
  has_one :app_module
end
