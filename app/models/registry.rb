class Registry < ApplicationRecord
  include Sluggable

  belongs_to :person_type, class_name: 'GenericModel'

  has_one :address, dependent: :destroy

  has_many :contacts, dependent: :destroy

  ransack_alias :search, :id_to_s

  def build_relationships!
    build_address
    contacts.build
  end
end
