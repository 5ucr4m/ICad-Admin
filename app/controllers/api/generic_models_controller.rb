# frozen_string_literal: true

module Api
  class GenericModelsController < Api::ApiController
    skip_before_action :authenticate_user!
    before_action :set_query, except: %i[cbo_types ethnicity_types]

    api :GET, '/generic_models', 'GET Type List'
    def types
      generic_models = Rails.cache.fetch('generic_models') do
        GenericModel.all
          .select(:id, :name, :reference, :generic_field)
          .group_by(&:generic_field)
      end
      render json: generic_models, adapter: false
    end

    private

    def nationalities; end

    def races; end

    def genders; end

    def ethnicities; end

    def countries; end

    def address_types; end

    def water_supplies; end

    def rural_production_areas; end

    def garbage_disposals; end

    def bathroom_drainage; end

    def home_wall_materials; end

    def home_locations; end

    def home_situations; end

    def hygiene_access; end

    def home_accesses; end

    def home_types; end

    def residence_types; end

    def water_treatments; end

    def pet_types; end

    def unit_types; end

    def cbo_types; end

    def breastfeeding; end

    def weight_situations; end

    def meals_per_day; end

    def street_situation_time; end

    def meals_origin_types; end

    def respiratory_diseases; end

    def kidney_problems; end

    def turns; end

    def outcomes; end

    def visit_reasons; end

    def sexual_orientations; end

    def education_levels; end

    def parent_relations; end

    def job_market_situations; end

    def child_responsible; end

    def left_reasons; end

    def family_incomes; end

    def set_query
      @query = GenericModel.ransack(params[:q])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_generic_model
      @generic_model = GenericModel.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def generic_model_params
      params.require(:generic_model).permit(:name, :description, :reference,
                                            :generic_field, :generic_class,
                                            :generic_model_id)
    end
  end
end
