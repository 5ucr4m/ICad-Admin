class OtherHealthCondition < ApplicationRecord

  belongs_to :health_condition, optional: true
  belongs_to :health_condition_type, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
