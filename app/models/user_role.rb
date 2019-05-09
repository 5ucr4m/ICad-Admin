# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id              :bigint           not null, primary key
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :bigint
#  user_company_id :bigint
#
# Indexes
#
#  index_user_roles_on_role_id          (role_id)
#  index_user_roles_on_user_company_id  (user_company_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#  fk_rails_...  (user_company_id => user_companies.id)
#

class UserRole < ApplicationRecord
  include Sluggable

  belongs_to :user_company
  belongs_to :role

  has_one :user, through: :user_company

  ransack_alias :search, :id_to_s
end
