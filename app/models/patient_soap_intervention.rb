class PatientSoapIntervention < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :patient_soap, optional: true
  belongs_to :ciap_code, class_name: 'GenericModel', optional: true
  belongs_to :cid_code, class_name: 'GenericModel', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
