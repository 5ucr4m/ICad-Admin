class Vaccine < ApplicationRecord

  belongs_to :immunobiological, optional: true
  belongs_to :vaccination_strategy, optional: true
  belongs_to :dose, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
