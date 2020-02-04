# frozen_string_literal: true

module Api
  class HomeVisitFormsController < Api::ApiController
    before_action :set_home_visit_form, only: %i[show update destroy]

    # GET /home_visit_forms
    def index
      authorize(HomeVisitForm)
      @query = HomeVisitForm.ransack(params[:q])
      @result = @query.result.includes(:company, :home_registration)
      @result = @result.where(user: current_user) if current_user.agent?
      if params[:home_visit_registration_id]
        @home_visit_forms = @home_visit_forms.where(home_visit_registration_id: params[:home_visit_registration_id])
      end
      render_json(@home_visit_forms)
    end

    # GET /home_visit_forms/1
    def show
      authorize(@home_visit_form)
      render_json(@home_visit_form)
    end

    # POST /home_visit_forms
    def create
      authorize(HomeVisitForm)
      @home_visit_form = current_user.home_visit_forms.build(home_visit_form_params)

      if @home_visit_form.save
        render_json(@home_visit_form, :created)
      else
        unprocessable_entity(@home_visit_form)
      end
    end

    # PATCH/PUT /home_visit_forms/1
    def update
      authorize(@home_visit_form)
      if @home_visit_form.update(home_visit_form_params)
        render_json(@home_visit_form, :ok, true)
      else
        unprocessable_entity(@home_visit_form)
      end
    end

    # DELETE /home_visit_forms/1
    def destroy
      authorize(@home_visit_form)
      @home_visit_form.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_home_visit_form
      @home_visit_form = if params[:home_visit_registration_id]
        HomeVisitForm
          .find_by(home_visit_registration_id: params[:home_visit_registration_id])
      else
        HomeVisitForm.find(params[:id])
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
                                              :service_at,
                                              :home_visit_registration_id,
                                              home_visit_reasons_attributes: %i[
                                                id
                                                reason_id
                                                _destroy
                                              ])
    end
  end
end
