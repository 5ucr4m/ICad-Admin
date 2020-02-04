# frozen_string_literal: true

class ProfessionalTeam < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :health_establishment, optional: true
  belongs_to :company, optional: true
  has_many :health_professionals, dependent: :nullify

  validates :name, :code, presence: true

  ransack_alias :search, :id_to_s_or_name_or_code_or_health_establishment_legal_full_name

  scope :active?, -> { where(active: true) }

  def name_formatted
    "#{code} - #{name}"
  end
end
