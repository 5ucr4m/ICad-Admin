# frozen_string_literal: true

module RenderJson
  def render_json(object, status = :ok, persisted = false)
    if object.is_a? ActiveRecord::Relation
      render json: object.page(params[:page])
    elsif persisted
      render(json: object, status: status, location: object)
    else
      render(json: object, status: status)
    end
  end
end
