class ApplicationSerializer < ActiveModel::Serializer

  def id
    object.slug
  end
end
