# frozen_string_literal: true

# == Schema Information
#
# Table name: home_registration_pets
#
#  id                   :bigint           not null, primary key
#  slug                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  company_id           :bigint
#  home_registration_id :bigint
#  pet_type_id          :bigint
#
# Indexes
#
#  index_home_registration_pets_on_company_id            (company_id)
#  index_home_registration_pets_on_home_registration_id  (home_registration_id)
#  index_home_registration_pets_on_pet_type_id           (pet_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (home_registration_id => home_registrations.id)
#  fk_rails_...  (pet_type_id => generic_models.id)
#

class HomeRegistrationPetSerializer < ActiveModel::Serializer
  attributes :id, :slug
  has_one :home_registration
  has_one :pet_type
end
