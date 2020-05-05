# frozen_string_literal: true

# == Schema Information
#
# Table name: family_members
#
#  id                :bigint           not null, primary key
#  birth_date        :date
#  brazil_entry_date :date
#  cns_number        :string
#  cns_responsible   :string
#  email             :string
#  father_name       :string
#  micro_area        :string
#  mother_name       :string
#  name              :string
#  naturalize_decree :string
#  naturalized_at    :date
#  out_area          :boolean
#  phone             :string
#  pis_pasep_number  :string
#  responsible       :boolean
#  slug              :string
#  social_name       :string
#  unknown_father    :boolean
#  unknown_mother    :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  birth_country_id  :bigint
#  city_id           :bigint
#  company_id        :bigint
#  ethnicity_id      :bigint
#  family_id         :bigint
#  gender_id         :bigint
#  nationality_id    :bigint
#  race_id           :bigint
#
# Indexes
#
#  index_family_members_on_birth_country_id  (birth_country_id)
#  index_family_members_on_city_id           (city_id)
#  index_family_members_on_company_id        (company_id)
#  index_family_members_on_ethnicity_id      (ethnicity_id)
#  index_family_members_on_family_id         (family_id)
#  index_family_members_on_gender_id         (gender_id)
#  index_family_members_on_nationality_id    (nationality_id)
#  index_family_members_on_race_id           (race_id)
#
# Foreign Keys
#
#  fk_rails_...  (birth_country_id => generic_models.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (ethnicity_id => generic_models.id)
#  fk_rails_...  (family_id => families.id)
#  fk_rails_...  (gender_id => generic_models.id)
#  fk_rails_...  (nationality_id => generic_models.id)
#  fk_rails_...  (race_id => generic_models.id)
#

class FamilyMember < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :family, optional: true
  belongs_to :city
  belongs_to :nationality, class_name: 'GenericModel'
  belongs_to :birth_country, class_name: 'GenericModel'
  belongs_to :race, class_name: 'GenericModel'
  belongs_to :gender, class_name: 'GenericModel'
  belongs_to :ethnicity, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true
  belongs_to :user, optional: true

  has_one :home_registration, through: :family
  has_one :individual_registration, dependent: :destroy
  has_one :home_visit_registration, dependent: :destroy
  has_many :home_visit_forms, through: :home_visit_registration
  has_many :vaccinations, dependent: :destroy
  has_many :vaccines, through: :vaccinations
  has_many :patient_records, dependent: :destroy
  has_many :appointment_bookings, dependent: :destroy
  has_many :appointment_demands, dependent: :destroy
  has_many :patient_conditions, dependent: :destroy
  has_many :patient_medicines, dependent: :destroy
  has_many :patient_reactions, dependent: :destroy
  has_many :patient_observations, dependent: :destroy
  has_many :patient_histories, dependent: :destroy


  validates :name, :birth_date, :cns_number, presence: true

  before_validation :set_user

  scope :responsible, -> { where(responsible: true) }

  ransack_alias :search, :id_to_s_or_name_or_social_name_or_federal_registry_or_state_registry_or_cns_number

  def name_formatted
    "#{cns_number} - #{name}"
  end

  def location_x
    return if home_registration.blank?

    home_registration.location_x
  end

  def location_y
    return if home_registration.blank?

    home_registration.location_y
  end

  def age
    return if birth_date.blank?

    if birth_date.year == Time.current.year
      months = Time.current.month - birth_date.month
      "#{months} #{months > 1 ? 'meses' : 'mês'}"
    else
      age = birth_date.year.years.until(Time.current).year
      "#{age} #{age > 1 ? 'anos' : 'ano'}"
    end
  end

  private

  def set_user
    return if family.blank? || family.user.blank?

    self.user = family.user
  end
end
