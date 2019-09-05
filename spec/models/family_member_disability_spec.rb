# frozen_string_literal: true

# == Schema Information
#
# Table name: family_member_disabilities
#
#  id                       :bigint           not null, primary key
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint
#  disability_id            :bigint
#  sociodemographic_info_id :bigint
#
# Indexes
#
#  index_family_member_disabilities_on_company_id                (company_id)
#  index_family_member_disabilities_on_disability_id             (disability_id)
#  index_family_member_disabilities_on_sociodemographic_info_id  (sociodemographic_info_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (disability_id => generic_models.id)
#  fk_rails_...  (sociodemographic_info_id => sociodemographic_infos.id)
#

require 'rails_helper'

RSpec.describe FamilyMemberDisability, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
