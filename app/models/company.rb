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

class Company < ApplicationRecord

  belongs_to :registry, optional: true
  has_many :user_companies
  has_many :users, through: :user_companies

  ransack_alias :search, :id_to_s
end
