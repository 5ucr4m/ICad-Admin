# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  health_professional_id :bigint
#
# Indexes
#
#  index_users_on_confirmation_token      (confirmation_token) UNIQUE
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_health_professional_id  (health_professional_id)
#  index_users_on_reset_password_token    (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider        (uid,provider) UNIQUE
#  index_users_on_unlock_token            (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (health_professional_id => health_professionals.id)
#

class User < ApplicationRecord
  include Sluggable

  has_one_attached :avatar

  has_one :health_professional, dependent: :nullify
  has_one :family_member, dependent: :nullify

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable

  include DeviseTokenAuth::Concerns::User

  has_many :user_companies, dependent: :destroy
  has_many :companies, through: :user_companies
  has_many :user_roles, through: :user_companies
  has_many :roles, through: :user_roles
  has_many :home_visit_registrations, dependent: :nullify
  has_many :home_visit_forms, dependent: :nullify
  has_many :home_registrations, dependent: :nullify
  has_many :individual_registrations, dependent: :nullify
  has_many :vaccinations, dependent: :nullify
  has_many :families, dependent: :nullify
  has_many :period_items, dependent: :nullify

  accepts_nested_attributes_for :user_companies, allow_destroy: true
  accepts_nested_attributes_for :health_professional, allow_destroy: false

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  # validate :check_user_roles

  accepts_nested_attributes_for :health_professional, allow_destroy: false
  accepts_nested_attributes_for :user_companies, allow_destroy: true

  ransack_alias :search, :id_to_s_or_email_or_health_professional_name_or_health_professional_cns_code

  scope :not_admin, -> { filter(&:not_admin?) }
  scope :without_user, -> { left_outer_joins(:health_professional).where(health_professionals: { id: nil }) }

  delegate :mayor?, to: :role
  delegate :support?, to: :role
  delegate :secretary?, to: :role
  delegate :doctor?, to: :role
  delegate :nurse?, to: :role
  delegate :nurse_aux?, to: :role
  delegate :agent?, to: :role
  delegate :dentist?, to: :role
  delegate :dentist_aux?, to: :role
  delegate :citizen?, to: :role
  delegate :service?, to: :role

  def active_for_authentication?
    super do |_s|
      agent? && company.present? || admin?
    end
  end

  def company
    current_company&.company
  end

  def administrative?
    current_company.administrative?
  end

  def service?
    current_company.service?
  end

  delegate :role, to: :current_role

  def send_confirmation_notification?
    skip_confirmation!
    false
  end

  def cns_code
    professional&.cns_code
  end

  def full_name
    professional&.legal_full_name
  end

  def cnes_code
    professional&.health_establishment&.cnes_code
  end

  def ine_code
    professional&.professional_team&.code
  end

  def federal_registry
    professional&.federal_registry
  end

  def admin?
    role.admin? && role.admin
  end

  def not_admin?
    !admin?
  end

  def not_citizen?
    !citizen?
  end

  private

  def professional
    return if health_professional.blank?

    health_professional
  end

  def current_company
    user_companies.includes(:company).find_by(current: true) || user_companies.includes(:company).first
  end

  def current_role
    user_roles.find_by(user_company: current_company) || user_roles.first
  end

  def check_user_roles
    return if user_companies.blank?

    if user_companies.map(&:company).uniq.count > user_companies.count
      errors.add(:base, 'Não é permitido ter multiplas funções na mesma Prefeitura.')
    end
  end
end
