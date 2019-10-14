# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  competence :date
#  deadline   :date
#  end_date   :date
#  slug       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_periods_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class Period < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :company, optional: true

  has_many :period_items, dependent: :destroy

  ransack_alias :search, :id_to_s
end
