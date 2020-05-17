class PatientSoap < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :patient_record, optional: true
  belongs_to :collected_time, class_name: 'GenericModel', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  has_many :patient_soap_reasons, dependent: :delete_all
  has_many :patient_soap_exams, dependent: :delete_all
  has_many :patient_soap_conditions, dependent: :delete_all
  has_many :patient_soap_interventions, dependent: :delete_all
  has_many :patient_soap_certificates, dependent: :delete_all
  has_many :patient_soap_reminders, dependent: :delete_all
  has_many :patient_soap_medicines, dependent: :delete_all

  accepts_nested_attributes_for :patient_soap_reasons, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_exams, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_conditions, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_interventions, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_certificates, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_reminders, allow_destroy: true
  accepts_nested_attributes_for :patient_soap_medicines, allow_destroy: true

  ransack_alias :search, :id_to_s
end
