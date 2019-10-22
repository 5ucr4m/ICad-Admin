# frozen_string_literal: true

module Api
  class HomeVisitRegistrationsController < Api::ApiController
    before_action :set_home_visit_registration, only: %i[show edit update destroy]

    # GET /home_visit_registrations
    def index
      @query = HomeVisitRegistration.ransack(params[:q])
      @pagy, @home_visit_registrations = pagy(@query.result, page: params[:page], items: 10)
    end

    # GET /home_visit_registrations/1
    def show
      render_json @home_visit_registration
    end

    # GET /home_visit_registrations/new
    def new
      @home_visit_registration = HomeVisitRegistration.new
      @home_visit_registration.build_family_member
    end

    # GET /home_visit_registrations/1/edit
    def edit; end

    # POST /home_visit_registrations
    def create
      @home_visit_registration = HomeVisitRegistration.new(home_visit_registration_params)
      @city_selected = @home_visit_registration.family_member.city.presence

      if @home_visit_registration.save
        render_json @home_visit_registration, :created
      else
        unprocessable_entity @home_visit_registration
      end
    end

    # PATCH/PUT /home_visit_registrations/1
    def update
      if @home_visit_registration.update(home_visit_registration_params)
        render_json @home_visit_registration, :created
      else
        unprocessable_entity @home_visit_registration
      end
    end

    # DELETE /home_visit_registrations/1
    def destroy
      @home_visit_registration.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_home_visit_registration
      @home_visit_registration = HomeVisitRegistration
                                                      .friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def home_visit_registration_params
      params.require(:home_visit_registration).permit(:uuid, :tp_cds_origin,
                                                      family_member_attributes: %i[
                                                        id
                                                        family_id
                                                        name
                                                        social_name
                                                        mother_name
                                                        father_name
                                                        birth_date
                                                        birth_country_id
                                                        city_id
                                                        nationality_id
                                                        naturalized_at
                                                        naturalize_decree
                                                        brazil_entry_date
                                                        email
                                                        cns_number
                                                        cns_responsible
                                                        phone
                                                        pis_pasep_number
                                                        race_id
                                                        gender_id
                                                        ethnicity_id
                                                        micro_area
                                                        unknown_father
                                                        unknown_mother
                                                        responsible
                                                        out_area
                                                      ],
                                                      home_visit_forms_attributes: [
                                                        :id,
                                                        :turn_id,
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
                                                        :_destroy,
                                                        home_visit_reasons_attributes: %i[
                                                          id
                                                          reason_id
                                                          _destroy
                                                        ]
                                                      ])
    end
  end
end
