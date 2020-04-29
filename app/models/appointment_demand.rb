# frozen_string_literal: true
class AppointmentDemand < ApplicationRecord
  belongs_to :family_member
  belongs_to :health_professional
  belongs_to :company, optional: true

  before_validation :check_demand

  ransack_alias :search, :id_to_s

  private

  def check_demand
    return if manage_medicine || curative || appointment_demand ||
        initial_listening || examination || nebulization ||
        dentistry || procedures || vaccine

    errors.add(:base, 'Uma demanda de atendimento deve ser informada.')
  end
end
