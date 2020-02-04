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

require 'rails_helper'

RSpec.describe(UserCompany, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
