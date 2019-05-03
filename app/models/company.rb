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
  include Sluggable

  belongs_to :registry
  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies

  accepts_nested_attributes_for :registry, allow_destroy: false

  ransack_alias :search, :id_to_s

  def build_nested
    build_registry
    registry.build_nested
  end


end
