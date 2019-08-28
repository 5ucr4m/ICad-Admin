# == Schema Information
#
# Table name: vaccination_items
#
#  id                  :bigint           not null, primary key
#  final_date_hour     :datetime
#  initial_date_hour   :datetime
#  leprosy_communicant :boolean
#  pregnant            :boolean
#  puerperal           :boolean
#  slug                :string
#  traveller           :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  family_member_id    :bigint
#  local_service_id    :bigint
#  turn_id             :bigint
#
# Indexes
#
#  index_vaccination_items_on_company_id        (company_id)
#  index_vaccination_items_on_family_member_id  (family_member_id)
#  index_vaccination_items_on_local_service_id  (local_service_id)
#  index_vaccination_items_on_turn_id           (turn_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_member_id => family_members.id)
#  fk_rails_...  (local_service_id => generic_models.id)
#  fk_rails_...  (turn_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe VaccinationItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
