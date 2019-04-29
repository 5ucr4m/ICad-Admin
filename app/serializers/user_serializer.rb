# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :email, :full_name

  def avatar_url
    rails_blob_url(object.avatar)
  end
end
