# == Schema Information
#
# Table name: in_street_situations
#
#  id                       :bigint           not null, primary key
#  familiar_reference       :boolean
#  family_visit             :boolean
#  has_other_accompanied    :boolean
#  has_personal_hygiene     :boolean
#  in_street_situation      :boolean
#  kinship_degree           :string
#  other_accompanied        :string
#  receive_benefits         :boolean
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint
#  meals_per_day_id         :bigint
#  street_situation_time_id :bigint
#
# Indexes
#
#  index_in_street_situations_on_company_id                (company_id)
#  index_in_street_situations_on_meals_per_day_id          (meals_per_day_id)
#  index_in_street_situations_on_street_situation_time_id  (street_situation_time_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (meals_per_day_id => generic_models.id)
#  fk_rails_...  (street_situation_time_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe InStreetSituation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
