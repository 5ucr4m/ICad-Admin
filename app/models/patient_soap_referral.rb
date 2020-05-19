class PatientSoapReferral < ApplicationRecord
  include Tenantable
  include Sluggable

  belongs_to :patient_soap, optional: true
  belongs_to :specialty, class_name: 'GenericModel', optional: true
  belongs_to :cid_code, class_name: 'GenericModel', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
