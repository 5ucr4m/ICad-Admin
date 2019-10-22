# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  has_many :user_roles
  has_many :user_companies, through: :user_roles
  has_many :companies, through: :user_companies
  has_many :users, through: :companies

  enum role_type: %i[admin mayor secretary doctor nurse nurse_aux agent dentist dentist_aux]

  ransack_alias :search, :id_to_s

  def name_formatted
    name.upcase
  end
end
