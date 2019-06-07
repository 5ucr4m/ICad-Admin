# frozen_string_literal: true

module Api
  class GenericModelsController < Api::ApiController
    before_action :set_query, except: %i[address_types cbo_types ethnicity_types]

    api :GET, '/generic_models/address_types', 'GET Address Types List'
    def address_types
      render_json @query.result.address_types.includes(:generic_model)
    end

    api :GET, '/generic_models/cbo_types', 'GET CBO Types List'
    def cbo_types
      render_json @query.result.cbo_types.includes(:generic_model)
    end

    api :GET, '/generic_models/ethnicity_types', 'GET Ethnicity Types List'
    def ethnicity_types
      render_json @query.result.ethnicities.includes(:generic_model)
    end

    private

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
