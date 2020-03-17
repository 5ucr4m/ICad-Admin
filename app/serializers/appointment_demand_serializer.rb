class AppointmentDemandSerializer < ApplicationSerializer
  attributes :id, :manage_medicine, :curative, :appointment_demand, :initial_listening, :examination, :nebulization, :dentistry, :procedures, :vaccine, :discarded_at, :ip
  has_one :family_member
  has_one :health_professional
  has_one :company
end
