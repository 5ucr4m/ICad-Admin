# == Schema Information
#
# Table name: professional_teams
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  code       :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_professional_teams_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

require 'rails_helper'

RSpec.describe ProfessionalTeam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
