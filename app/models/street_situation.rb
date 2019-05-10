# == Schema Information
#
# Table name: street_situations
#
#  id                    :bigint           not null, primary key
#  accompanied           :boolean
#  familiar_reference    :boolean
#  family_visit          :boolean
#  has_personal_hygiene  :boolean
#  kinship_degree        :string
#  meals_origin          :text
#  meals_per_day         :integer
#  other_accompanied     :string
#  personal_hygiene      :text
#  receive_benefits      :boolean
#  slug                  :string
#  street_situation      :boolean
#  street_situation_time :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  company_id            :bigint
#
# Indexes
#
#  index_street_situations_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class StreetSituation < ApplicationRecord
  include Sluggable

  belongs_to :company

  ransack_alias :search, :id_to_s
end
