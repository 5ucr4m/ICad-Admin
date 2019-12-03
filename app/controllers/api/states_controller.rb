# frozen_string_literal: true

module Api
  class StatesController < Api::ApiController
    load_and_authorize_resource
    before_action :set_state, only: %i[show]

    # GET /states
    def index
      states = Rails.cache.fetch('states') do
        State.all
      end
      render json: states, adapter: false
    end

    # GET /states/1
    def show
      render_json @state
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:id)
    end
  end
end
