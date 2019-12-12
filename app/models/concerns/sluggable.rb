# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug, use: :slugged
    before_create :generate_slug

    ransacker :id_to_s do
      Arel.sql("regexp_replace(to_char(\"#{table_name}\".\"id\", '9999999'), ' ', '', 'g')")
    end
  end

  private

  def generate_slug
    uuuid = SecureRandom.uuid
    model_name = self.class.model_name.name.constantize
    if uuid_classes.include?(model_name)
      self.uuid = uuuid if uuid.blank?
      self.uuid_form_origin = uuuid if model_name != Vaccination && uuid_form_origin.blank?
    end
    self.slug = uuuid.delete('-') if slug.blank?
  end

  def uuid_classes
    [HomeRegistration, HomeVisitRegistration, IndividualRegistration, Vaccination]
  end
end
