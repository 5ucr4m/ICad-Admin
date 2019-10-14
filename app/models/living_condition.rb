# frozen_string_literal: true

# == Schema Information
#
# Table name: living_conditions
#
#  id                       :bigint           not null, primary key
#  electric_power           :boolean
#  residents                :integer
#  rooms                    :integer
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  bathroom_drainage_id     :bigint
#  company_id               :bigint
#  garbage_disposal_id      :bigint
#  home_access_id           :bigint
#  home_location_id         :bigint
#  home_situation_id        :bigint
#  home_type_id             :bigint
#  home_wall_material_id    :bigint
#  rural_production_area_id :bigint
#  water_supply_id          :bigint
#  water_treatment_id       :bigint
#
# Indexes
#
#  index_living_conditions_on_bathroom_drainage_id      (bathroom_drainage_id)
#  index_living_conditions_on_company_id                (company_id)
#  index_living_conditions_on_garbage_disposal_id       (garbage_disposal_id)
#  index_living_conditions_on_home_access_id            (home_access_id)
#  index_living_conditions_on_home_location_id          (home_location_id)
#  index_living_conditions_on_home_situation_id         (home_situation_id)
#  index_living_conditions_on_home_type_id              (home_type_id)
#  index_living_conditions_on_home_wall_material_id     (home_wall_material_id)
#  index_living_conditions_on_rural_production_area_id  (rural_production_area_id)
#  index_living_conditions_on_water_supply_id           (water_supply_id)
#  index_living_conditions_on_water_treatment_id        (water_treatment_id)
#
# Foreign Keys
#
#  fk_rails_...  (bathroom_drainage_id => generic_models.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (garbage_disposal_id => generic_models.id)
#  fk_rails_...  (home_access_id => generic_models.id)
#  fk_rails_...  (home_location_id => generic_models.id)
#  fk_rails_...  (home_situation_id => generic_models.id)
#  fk_rails_...  (home_type_id => generic_models.id)
#  fk_rails_...  (home_wall_material_id => generic_models.id)
#  fk_rails_...  (rural_production_area_id => generic_models.id)
#  fk_rails_...  (water_supply_id => generic_models.id)
#  fk_rails_...  (water_treatment_id => generic_models.id)
#

class LivingCondition < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :water_supply, class_name: 'GenericModel', optional: true
  belongs_to :rural_production_area, class_name: 'GenericModel', optional: true
  belongs_to :garbage_disposal, class_name: 'GenericModel', optional: true
  belongs_to :bathroom_drainage, class_name: 'GenericModel', optional: true
  belongs_to :home_location, class_name: 'GenericModel', optional: true
  belongs_to :home_wall_material, class_name: 'GenericModel', optional: true
  belongs_to :home_situation, class_name: 'GenericModel', optional: true
  belongs_to :home_access, class_name: 'GenericModel', optional: true
  belongs_to :home_type, class_name: 'GenericModel', optional: true
  belongs_to :water_treatment, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
