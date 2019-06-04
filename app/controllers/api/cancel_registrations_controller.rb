# frozen_string_literal: true

module Api
  class CancelRegistrationsController < Api::ApiController
    before_action :set_cancel_registration, only: %i[show update destroy]

    # GET /cancel_registrations/1
    def show; end

    # POST /cancel_registrations
    def create
      @cancel_registration = CancelRegistration.new(cancel_registration_params)

      if @cancel_registration.save
        render_json @cancel_registration, :created
      else
        unprocessable_entity @cancel_registration
      end
    end

    # PATCH/PUT /cancel_registrations/1
    def update
      if @cancel_registration.update(cancel_registration_params)
        render_json @cancel_registration, :ok, true
      else
        unprocessable_entity @cancel_registration
      end
    end

    # DELETE /cancel_registrations/1
    def destroy
      @cancel_registration.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_cancel_registration
      @cancel_registration = if params[:individual_registration_id]
                               CancelRegistration.find_by(individual_registration_id: params[:individual_registration_id])
                             else
                               CancelRegistration.friendly.find(params[:id])
                             end
    end

    # Only allow a trusted parameter "white list" through.
    def cancel_registration_params
      params.require(:cancel_registration).permit(:left_reason_id,
                                                  :decease_date,
                                                  :decease_number)
    end
  end
end
