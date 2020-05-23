# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  health_professional_id :bigint
#
# Indexes
#
#  index_users_on_confirmation_token      (confirmation_token) UNIQUE
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_health_professional_id  (health_professional_id)
#  index_users_on_reset_password_token    (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider        (uid,provider) UNIQUE
#  index_users_on_unlock_token            (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (health_professional_id => health_professionals.id)
#

class UserSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :email, :cns_code

  attribute :full_name, if: :not_citizen?
  attribute :cnes_code, if: :not_citizen?
  attribute :ine_code, if: :not_citizen?
  attribute :health_professional_id, if: :not_citizen?
  attribute :professional_team, if: :not_citizen?
  attribute :health_establishment, if: :not_citizen?
  attribute :federal_registry, if: :not_citizen?
  attribute :state_registry, if: :not_citizen?

  attribute :name, if: :citizen?
  attribute :social_name, if: :citizen?
  attribute :patio, if: :citizen?
  attribute :city, if: :citizen?
  attribute :state, if: :citizen?
  attribute :birth_date, if: :citizen?
  attribute :phone, if: :citizen?
  attribute :gender, if: :citizen?
  attribute :district, if: :citizen?
  attribute :number, if: :citizen?
  attribute :zip, if: :citizen?
  attribute :complement, if: :citizen?
  attribute :reference, if: :citizen?
  attribute :referential_phone, if: :citizen?
  attribute :vaccinations, if: :citizen?
  attribute :home_registration, if: :citizen?
  attribute :individual_registration, if: :citizen?
  attribute :home_visit_forms, if: :citizen?
  attribute :vaccines, if: :citizen?

  attribute :professional_appointment_bookings, if: :not_citizen?
  attribute :professional_appointment_demands, if: :not_citizen?
  attribute :professional_patient_record_bookings, if: :not_citizen?
  attribute :professional_patient_record_demands, if: :not_citizen?

  attribute :appointment_bookings, if: :citizen?
  attribute :appointment_demands, if: :citizen?
  attribute :patient_records, if: :citizen?

  delegate :citizen?, to: :object
  delegate :not_citizen?, to: :object

  def vaccinations
    user_info&.vaccinations
  end

  def appointment_bookings
    user_info&.appointment_bookings
  end

  def appointment_demands
    user_info&.appointment_demands
  end

  def patient_records
    user_info&.patient_records
  end

  def professional_appointment_bookings
    user_info&.appointment_bookings
  end

  def professional_appointment_demands
    user_info&.appointment_demands
  end

  def professional_patient_record_bookings
    user_info&.patient_records
  end

  def professional_patient_record_demands
    user_info&.patient_records
  end

  def home_registration
    user_info&.home_registration
  end

  def individual_registration
    user_info&.individual_registration
  end

  def home_visit_forms
    user_info&.home_visit_forms
  end

  def vaccines
    user_info&.vaccines
  end

  def cns_code
    if object.citizen?
      user_info&.cns_number
    else
      user_info&.cns_code
    end
  end

  def health_professional_id
    user_info&.id
  end

  def professional_team
    user_info&.professional_team&.name
  end

  def health_establishment
    user_info&.health_establishment&.legal_full_name
  end

  def cnes_code
    user_info&.professional_team&.health_establishment&.cnes_code
  end

  def federal_registry
    return unless object.agent?

    user_info&.federal_registry
  end

  def state_registry
    return unless object.agent?

    user_info&.state_registry
  end

  def full_name
    user_info&.full_name
  end

  def avatar_url
    rails_blob_url(object.avatar) if object.avatar.present?
  end

  def social_name
    user_info&.social_name
  end

  def name
    user_info&.name
  end

  def city
    address&.city&.name
  end

  def state
    address&.city&.state&.abbreviation
  end

  def patio
    address&.patio
  end

  def district
    address&.district
  end

  def number
    address&.number
  end

  def zip
    address&.zip
  end

  def complement
    address&.& complement
  end

  def reference
    address&.reference
  end

  def referential_phone
    address&.referential_phone
  end

  def birth_date
    user_info&.birth_date
  end

  def phone
    address&.phone
  end

  def gender
    address&.gender&.name
  end

  private

  def user_info
    if object.citizen?
      family_member
    else
      health_professional
    end
  end

  def health_professional
    RailsMultitenant::GlobalContextRegistry[:company_id] = object.company.id
    health_professionals = HealthProfessional.strip_company_scope.all

    health_professionals.find_by(id: object.health_professional.id)
  end

  def family_member
    RailsMultitenant::GlobalContextRegistry[:company_id] = object.company.id
    family_members = FamilyMember.strip_company_scope.all
    family_members.find_by(id: object.family_member.id)
  end

  def address
    return unless object.citizen?
    return if user_info&.family.blank?
    user_info&.family&.home_registration&.address
  end
end
