class AppointmentBooking < ApplicationRecord
  include Sluggable
  include Tenantable

  has_rich_text :observation

  belongs_to :health_professional
  belongs_to :family_member, class_name: 'FamilyMember'
  belongs_to :medical_procedure, class_name: 'GenericModel'
  belongs_to :company

  validates :appointment_date, :start_hour, :end_hour, :observation, presence: true

  ransack_alias :search, :id_to_s
end
