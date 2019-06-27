# frozen_string_literal: true

# == Schema Information
#
# Table name: families
#
#  id                     :bigint           not null, primary key
#  handbook_number        :string
#  members_quantity       :integer
#  moving                 :boolean
#  reside_since           :date
#  responsible_birth_date :date
#  responsible_cns_number :string
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint
#  family_income_id       :bigint
#  home_registration_id   :bigint
#
# Indexes
#
#  index_families_on_company_id            (company_id)
#  index_families_on_family_income_id      (family_income_id)
#  index_families_on_home_registration_id  (home_registration_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_income_id => generic_models.id)
#  fk_rails_...  (home_registration_id => home_registrations.id)
#

require 'rails_helper'

RSpec.describe Family, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
