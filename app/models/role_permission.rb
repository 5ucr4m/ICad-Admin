class RolePermission < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :role
  belongs_to :permission
  belongs_to :company

  ransack_alias :search, :id_to_s
end
