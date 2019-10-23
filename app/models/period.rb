# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  competence :string
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

  accepts_nested_attributes_for :period_items, allow_destroy: true

  validates :competence, :start_date, :end_date, :deadline, presence: true

  ransack_alias :search, :id_to_s

  private

  def check_dates; end

  def check_start_date
    return if start_date.blank?

    if end_date.present? && start_date > end_date
      errors.add(:start_date, 'Não pode ser maior que a data final')
    end

    if deadline.present? && start_date > deadline
      errors.add(:start_date, 'Não pode ser maior que a data limite final')
    end
  end

  def check_end_date
    return if end_date.blank?

    if end_date.present? && end_date < start_date
      errors.add(:start_date, 'Não pode ser menor que a data inicial')
    end

    if deadline.present?
      if end_date > deadline
        errors.add(:start_date, 'Não pode ser maior que a data limite final')
      end
    end
  end
end
