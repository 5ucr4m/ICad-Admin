class PatientSoapMedicine < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :patient_soap, optional: true
  belongs_to :medicine
  belongs_to :pharmaceutical_form, class_name: 'GenericModel'
  belongs_to :administration_way, class_name: 'GenericModel', optional: true
  belongs_to :recipe_type, class_name: 'GenericModel', optional: true
  belongs_to :dose_frequency_type, class_name: 'GenericModel', optional: true
  belongs_to :duration_type, class_name: 'GenericModel', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
