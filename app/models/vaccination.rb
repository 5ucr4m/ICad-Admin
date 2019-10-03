# frozen_string_literal: true

class Vaccination < ApplicationRecord
  include Sluggable

  belongs_to :header_transport
  belongs_to :vaccination_campaign
  belongs_to :company, optional: true

  has_many :vaccination_vaccines
  has_many :vaccines, through: :vaccination_vaccines
  has_many :vaccination_items

  accepts_nested_attributes_for :vaccination_items, allow_destroy: true
  accepts_nested_attributes_for :vaccination_vaccines, allow_destroy: true

  ransack_alias :search, :id_to_s
end
