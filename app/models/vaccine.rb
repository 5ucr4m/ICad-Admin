# == Schema Information
#
# Table name: vaccines
#
#  id                      :bigint           not null, primary key
#  description             :string
#  lot_number              :string
#  manufacturer            :string
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
#  dose_id                 :bigint
#  immunobiological_id     :bigint
#  vaccination_strategy_id :bigint
#
# Indexes
#
#  index_vaccines_on_company_id               (company_id)
#  index_vaccines_on_dose_id                  (dose_id)
#  index_vaccines_on_immunobiological_id      (immunobiological_id)
#  index_vaccines_on_vaccination_strategy_id  (vaccination_strategy_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (dose_id => generic_models.id)
#  fk_rails_...  (immunobiological_id => generic_models.id)
#  fk_rails_...  (vaccination_strategy_id => generic_models.id)
#

class Vaccine < ApplicationRecord
  include Sluggable

  belongs_to :immunobiological, class_name: 'GenericModel'
  belongs_to :vaccination_strategy, class_name: 'GenericModel'
  belongs_to :dose, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
