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

class PeriodSerializer < ActiveModel::Serializer
  attributes :id, :competence, :start_date, :end_date, :deadline, :slug
  has_one :company
end
