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
    if [HomeRegistration, IndividualRegistration].include?(model_name) || model_name == HomeVisitForm
      self.service_at = Time.zone.now if service_at.blank?
      self.uuid = uuuid if uuid.blank?
      self.uuid_form_origin = uuuid if uuid_form_origin.blank?
    end
    self.slug = uuuid.delete('-') if slug.blank?
  end
end
