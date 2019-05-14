class HealthCondition < ApplicationRecord

  belongs_to :weight_situation, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
