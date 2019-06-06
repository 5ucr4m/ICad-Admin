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
  has_many :roles, through: :user_companies

  ransacker :id_to_s do
    Arel.sql("regexp_replace(to_char(\"#{table_name}\".\"id\", '9999999'), ' ', '', 'g')")
  end

  attr_accessor :company, :cns_code, :cnes_code

  ransack_alias :search, :id_to_s_or_email_or_health_professional_name_or_health_professional_cns_code

  validates :cns_code, :cnes_code, presence: true

  before_create :define_health_professional

  def current_company
    user_companies.find(&:current) || user_companies.first
  end

  def send_confirmation_notification?
    skip_confirmation!
    false
  end

  private

  def check_health_establishment
    health_establishment = HealthEstablishment.find_by(cnes_code: cnes_code)
    if health_establishment.present?
      errors.add(:cns_code, 'Não pode ficar em branco.') && return if cns_code.blank?
      HealthProfessional.create!(cns_code: cns_code,
                                 health_establishment: health_establishment)
    else
      errors.add(:cnes_code, "#{HealthEstablishment.model_name.human(count: 1)} não encontrada.")
    end
  end

  def define_health_professional
    return if health_professional.present?

    check_health_establishment
  end
end
