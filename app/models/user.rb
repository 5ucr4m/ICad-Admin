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

  belongs_to :health_professional, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable

  include DeviseTokenAuth::Concerns::User

  has_many :user_companies, dependent: :destroy
  has_many :companies, through: :user_companies
  has_many :user_roles, through: :user_companies
  has_many :roles, through: :user_roles
  has_many :permissions, through: :roles

  accepts_nested_attributes_for :user_companies, allow_destroy: true

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  accepts_nested_attributes_for :health_professional, allow_destroy: false
  accepts_nested_attributes_for :user_companies, allow_destroy: true

  scope :by_company, ->(company) { includes(:user_companies).where(user_companies: { company: company }) }

  ransacker :id_to_s do
    Arel.sql("regexp_replace(to_char(\"#{table_name}\".\"id\", '9999999'), ' ', '', 'g')")
  end

  ransack_alias :search, :id_to_s_or_email_or_health_professional_name_or_health_professional_cns_code

  def company
    current_company.company
  end

  def role
    current_role.role
  end

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
    role.admin?
  end

  def mayor?
    role.mayor?
  end

  def secretary?
    role.secretary?
  end

  def doctor?
    role.doctor?
  end

  def nurse?
    role.nurse?
  end

  def nurse_aux?
    role.nurse_aux?
  end

  def agent?
    role.agent?
  end

  def dentist?
    role.dentist?
  end

  def dentist_aux?
    role.dentist_aux?
  end

  private

  def professional
    return if health_professional&.blank?

    health_professional
  end

  def current_company
    user_companies.find_by(current: true) || user_companies.first
  end

  def current_role
    user_roles.find_by(user_company: current_company) || user_roles.first
  end
end
