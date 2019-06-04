# frozen_string_literal: true

module Api
  class StatesController < Api::ApiController
    before_action :set_state, only: %i[show edit update destroy]

    # GET /states
    def index
      @query = State.ransack(params[:q])
      render_json @query.result.page(params[:page])
    end

    # GET /states/1
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:id)
    end
  end

end
