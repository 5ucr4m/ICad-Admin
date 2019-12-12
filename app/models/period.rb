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
  before_update :check_period_items

  ransack_alias :search, :id_to_s

  validates_uniqueness_of :competence
  validate :check_start_date, :check_end_date, :check_competence, :check_deadline_period

  scope :current_period, lambda {
    last_day = Time.zone.today.end_of_month.to_date + 1.month
    where('start_date >= ? AND deadline < ?', Time.zone.today.beginning_of_month.to_date, last_day).first
  }

  def name_formatted
    "#{competence} - Período de #{start_date.strftime('%d/%m/%Y')} até #{deadline.strftime('%d/%m/%Y')}"
  end

  private

  def check_dates; end

  def check_start_date
    return if start_date.blank?

    if end_date.present? && start_date > end_date
      errors.add(:start_date, 'Não pode ser maior que a data final')
    end

    return if deadline.blank?

    if start_date > deadline
      errors.add(:start_date, 'Não pode ser maior que a data limite final')
    end
  end

  def check_end_date
    return if end_date.blank?

    if end_date.present? && end_date < start_date
      errors.add(:end_date, 'Não pode ser menor que a data inicial')
    end

    return if deadline.blank?

    if end_date > deadline
      errors.add(:end_date, 'Não pode ser maior que a data limite final')
    end

    return unless deadline < end_date

    errors.add(:deadline, 'Não pode ser menor que a data final')
  end

  def check_period_items
    return if period_items.empty?

    errors.add(:base, 'Não é permitido editar Períodos com fichas inserídas.')
  end

  def check_competence
    return if competence.blank?

    return if start_date.blank?

    if start_date.year.to_i != competence.split('/')[1].to_i
      errors.add(:start_date, "não pertence ao Período #{competence.split('/')[1]}")
    end

    exists = Period.exists?(deadline: start_date)

    if exists
      errors.add(:start_date, 'já está sendo usada em um periodo limite registrado')
    end

    return if end_date.blank?

    if end_date.year.to_i != competence.split('/')[1].to_i
      errors.add(:end_date, "não pertence ao Período #{competence.split('/')[1]}")
    end

    return if deadline.blank?

    return unless Period.exists?(start_date: deadline)

    errors.add(:deadline, 'já está sendo usádo em um periodo inicial registrado')

    if deadline >= (start_date + 1.month)
      errors.add(:deadline, 'não pode ser superior à 1 mês do período inicial')
    end
  end

  def check_deadline_period
    return if deadline.blank? || start_date.blank?

    if deadline > (end_date + 1.month)
      errors.add(:deadline, 'não pode ser igual ou superior à 1 mês do período final')
    end
  end
end
