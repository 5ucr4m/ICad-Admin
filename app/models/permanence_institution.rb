class PermanenceInstitution < ApplicationRecord

  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
