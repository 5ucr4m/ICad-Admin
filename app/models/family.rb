# == Schema Information
#
# Table name: families
#
#  id                     :bigint           not null, primary key
#  family_income_cents    :integer
#  family_members         :integer
#  handbook_number        :string
#  moving                 :boolean
#  reside_since           :date
#  responsible_birth_date :date
#  responsible_cns_number :string
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint
#  home_registration_id   :bigint
#
# Indexes
#
#  index_families_on_company_id            (company_id)
#  index_families_on_home_registration_id  (home_registration_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (home_registration_id => home_registrations.id)
#

class Family < ApplicationRecord
  include Sluggable

  belongs_to :home_registration
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
