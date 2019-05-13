class LivingCondition < ApplicationRecord

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
