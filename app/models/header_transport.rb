class HeaderTransport < ApplicationRecord

  belongs_to :health_professional, optional: true
  belongs_to :city, optional: true
  belongs_to :main_lot_form, optional: true
  belongs_to :shared_lot_form, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
