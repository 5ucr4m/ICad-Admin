# frozen_string_literal: true

module Api
  class HomeVisitFormsController < Api::ApiController
    before_action :set_home_visit_form, only: %i[show update destroy]

    # GET /home_visit_forms
    def index
      @query = HomeVisitForm.ransack(params[:q])
      @home_visit_forms = @query.result.includes(:company, :home_registration)
      if params[:home_visit_registration_id]
        @home_visit_forms = @home_visit_forms.where(home_visit_registration_id: params[:home_visit_registration_id])
      end
      render_json @home_visit_forms
    end

    # GET /home_visit_forms/1
    def show; end

    # POST /home_visit_forms
    def create
      @home_visit_form = HomeVisitForm.new(home_visit_form_params)

      if @home_visit_form.save
        render_json @home_visit_form, :created
      else
        unprocessable_entity @home_visit_form
      end
    end

    # PATCH/PUT /home_visit_forms/1
    def update
      if @home_visit_form.update(home_visit_form_params)
        render_json @home_visit_form, :ok, true
      else
        unprocessable_entity @home_visit_form
      end
    end

    # DELETE /home_visit_forms/1
    def destroy
      @home_visit_form.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_home_visit_form
      @home_visit_form = if params[:home_visit_registration_id]
                           HomeVisitForm.find_by(home_visit_registration_id: params[:home_visit_registration_id])
                         else
                           HomeVisitForm.friendly.find(params[:id])
                         end
    end

    # Only allow a trusted parameter "white list" through.
    def home_visit_form_params
      params.require(:home_visit_form).permit(:turn_id,
                                              :handbook_number,
                                              :cns_number,
                                              :birth_date,
                                              :gender_id,
                                              :other_visit,
                                              :outcome_id,
                                              :micro_area,
                                              :out_area,
                                              :home_type_id,
                                              :weight_monitoring,
                                              :height_monitoring,
                                              :home_visit_registration_id,
                                              home_visit_reasons: %i[
                                                home_visit_form_id
                                                reason_id
                                                _destroy
                                              ])
    end
  end
end
