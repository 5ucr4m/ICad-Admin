# frozen_string_literal: true

# == Schema Information
#
# Table name: families
#
#  id                     :bigint           not null, primary key
#  handbook_number        :string
#  members_quantity       :integer
#  moving                 :boolean
#  reside_since           :date
#  responsible_birth_date :date
#  responsible_cns_number :string
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint
#  family_income_id       :bigint
#  home_registration_id   :bigint
#
# Indexes
#
#  index_families_on_company_id            (company_id)
#  index_families_on_family_income_id      (family_income_id)
#  index_families_on_home_registration_id  (home_registration_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_income_id => generic_models.id)
#  fk_rails_...  (home_registration_id => home_registrations.id)
#

class Family < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :home_registration, optional: true
  belongs_to :company, optional: true
  belongs_to :family_income, class_name: 'GenericModel'
  belongs_to :user, optional: true

  has_many :family_members, dependent: :nullify

  accepts_nested_attributes_for :home_registration, allow_destroy: false

  validates :responsible_cns_number, :responsible_birth_date, :members_quantity,
            :handbook_number, :reside_since, presence: true

  before_validation :set_user_to_family_members

  ransack_alias :search, :id_to_s_or_handbook_number

  def build_relationships
    build_home_registration
  end

  def family_name
    handbook_number
  end

  private

  def set_user_to_family_members
    return if family_members.blank?

    family_members.each do |fm|
      next if fm&.user.present?

      fm.user = user
    end
  end
end
