# frozen_string_literal: true

# == Schema Information
#
# Table name: user_companies
#
#  id         :bigint           not null, primary key
#  current    :boolean
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_companies_on_company_id  (company_id)
#  index_user_companies_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#

class UserCompany < ApplicationRecord
  include Sluggable

  belongs_to :user
  belongs_to :company

  has_many :user_roles, dependent: :destroy

  accepts_nested_attributes_for :user_roles, allow_destroy: true

  ransack_alias :search, :id_to_s
end
