# frozen_string_literal: true

class WebController < ::ApplicationController
  include Pagy::Backend
  include RenderJson
  include JsonExceptionHandler

  before_action :authenticate_user!
end
