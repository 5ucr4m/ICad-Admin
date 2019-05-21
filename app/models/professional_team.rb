# frozen_string_literal: true

# == Schema Information
#
# Table name: professional_teams
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  code       :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_professional_teams_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class ProfessionalTeam < ApplicationRecord
  include Sluggable

  belongs_to :company
  has_many :health_professionals, dependent: :nullify

  ransack_alias :search, :id_to_s
end
