class PatientCondition < ApplicationRecord
  include Sluggable
  include Tenantable
  belongs_to :family_member, optional: true
  belongs_to :medical_procedure, class_name: 'GenericModel', optional: true
  belongs_to :ciap_code, class_name: 'GenericModel', optional: true
  belongs_to :cid_code, class_name: 'GenericModel', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
