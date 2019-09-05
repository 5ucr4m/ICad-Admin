# frozen_string_literal: true

# == Schema Information
#
# Table name: home_registrations
#
#  id                        :bigint           not null, primary key
#  finished                  :boolean
#  form_updated              :boolean
#  location_x                :string
#  location_y                :string
#  pet_quantity              :integer
#  refuse_registration       :boolean
#  slug                      :string
#  tp_cds_origin             :integer
#  uuid                      :string
#  uuid_form_origin          :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  address_id                :bigint
#  company_id                :bigint
#  health_professional_id    :bigint
#  home_type_id              :bigint
#  living_condition_id       :bigint
#  permanence_institution_id :bigint
#
# Indexes
#
#  index_home_registrations_on_address_id                 (address_id)
#  index_home_registrations_on_company_id                 (company_id)
#  index_home_registrations_on_health_professional_id     (health_professional_id)
#  index_home_registrations_on_home_type_id               (home_type_id)
#  index_home_registrations_on_living_condition_id        (living_condition_id)
#  index_home_registrations_on_permanence_institution_id  (permanence_institution_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_professional_id => health_professionals.id)
#  fk_rails_...  (home_type_id => generic_models.id)
#  fk_rails_...  (living_condition_id => living_conditions.id)
#  fk_rails_...  (permanence_institution_id => permanence_institutions.id)
#

FactoryBot.define do
  factory :home_registration do
    location_x { 'MyString' }
    location_y { 'MyString' }
    health_professional { nil }
    living_condition { nil }
    address { nil }
    form_updated { false }
    pet_quantity { 1 }
    refuse_registration { false }
    tp_cds_origin { 1 }
    uuid { 'MyString' }
    uuid_form_origin { 'MyString' }
    home_type { nil }
    permanence_institution { nil }
    finished { false }
    company { nil }
    slug { 'MyString' }
  end
end
