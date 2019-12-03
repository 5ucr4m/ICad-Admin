# frozen_string_literal: true

module Api
  class GenericModelsController < Api::ApiController
    skip_before_action :authenticate_user!
    before_action :set_query, except: %i[types cbo_types ethnicity_types]

    def types
      generic_models = Rails.cache.fetch('generic_models') do
        GenericModel.all
                    .select(:id, :name, :reference, :generic_field)
                    .group_by(&:generic_field)
      end
      render json: generic_models, adapter: false
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_generic_model
      @generic_model = GenericModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def generic_model_params
      params.require(:generic_model).permit(:name, :description, :reference,
                                            :generic_field, :generic_class,
                                            :generic_model_id)
    end
  end
end
