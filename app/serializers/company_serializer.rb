# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  registry_id :bigint
#
# Indexes
#
#  index_companies_on_registry_id  (registry_id)
#
# Foreign Keys
#
#  fk_rails_...  (registry_id => registries.id)
#

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :slug
  has_one :registry
end
