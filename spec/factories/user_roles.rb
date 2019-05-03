# == Schema Information
#
# Table name: user_roles
#
#  id              :bigint           not null, primary key
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

FactoryBot.define do
  factory :user_role do
    user_company { nil }
    role { nil }
  end
end
