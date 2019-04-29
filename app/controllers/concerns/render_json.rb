# frozen_string_literal: true

module RenderJson
  include PagerApi::Pagination::Kaminari

  def render_json(object, status = :ok, persisted = false)
    if object.is_a? ActiveRecord::Relation
      paginate object, per_page: 20
    else
      persisted ? render(json: object, status: status, location: object) : render(json: object, status: status)
    end
  end
end
