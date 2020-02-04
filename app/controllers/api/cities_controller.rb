# frozen_string_literal: true

module Api
  class CitiesController < Api::ApiController
    skip_before_action :authenticate_user!
    before_action :set_city, only: %i[show]

    # GET /cities
    def index
      authorize(City)
      cities = Rails.cache.fetch('cities') do
        City.all
      end
      render(json: cities, adapter: false)
    end

    # GET /cities/1
    def show
      authorize(@city)
      render_json(@city)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :abbreviation, :code, :state_id, :reference)
    end
  end
end
