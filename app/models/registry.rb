# == Schema Information
#
# Table name: registries
#
#  id               :bigint           not null, primary key
#  fancy_name       :string
#  federal_registry :string
#  legal_full_name  :string
#  slug             :string
#  social_name      :string
#  state_registry   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  person_type_id   :bigint
#
# Indexes
#
#  index_registries_on_person_type_id  (person_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_type_id => generic_models.id)
#

class Registry < ApplicationRecord
  include Sluggable

  belongs_to :person_type, class_name: 'GenericModel'

  has_one :address, dependent: :destroy

  has_many :contacts, dependent: :destroy

  ransack_alias :search, :id_to_s

  def build_relationships!
    build_address
    contacts.build
  end
end
