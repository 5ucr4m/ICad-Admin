class PatientMedicine < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :family_member, optional: true
  belongs_to :user, optional: true
  belongs_to :medicine, class_name: 'GenericModel'
  belongs_to :pharmaceutical_form, class_name: 'GenericModel'
  belongs_to :way_administration, class_name: 'GenericModel'
  belongs_to :recipe_type, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
