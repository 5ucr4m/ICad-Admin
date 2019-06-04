# frozen_string_literal: true

module Api
  class CitiesController < Api::ApiController
    # load_and_authorize_resource
    before_action :set_city, only: %i[show]

    # GET /cities
    def index
      @query = City.ransack(params[:q])
      render_json @query.result.includes(:state).order(:name)
    end

    # GET /cities/1
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :abbreviation, :code, :state_id, :reference)
    end
  end
end
