# frozen_string_literal: true

class IndividualRegistrationsController < WebController
  before_action :set_individual_registration, only: %i[show edit update destroy]

  breadcrumb IndividualRegistration.model_name.human(count: 2), :individual_registrations_path

  # GET /individual_registrations
  def index
    @query = IndividualRegistration.ransack(params[:q])
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @individual_registrations = pagy(@result, page: params[:page], items: 10)
  end

  # GET /individual_registrations/1
  def show
    breadcrumb @individual_registration.slug, individual_registration_path(@individual_registration)
  end

  # GET /individual_registrations/new
  def new
    breadcrumb "#{t('helpers.submit.new')} #{IndividualRegistration.model_name.human}", new_individual_registration_path
    @individual_registration = IndividualRegistration.new
    @individual_registration.build_relationships
    @occupation_selected = @individual_registration.sociodemographic_info.occupation.presence
  end

  # GET /individual_registrations/1/edit
  def edit
    breadcrumb @individual_registration.slug, individual_registration_path(@individual_registration)
  end

  # POST /individual_registrations
  def create
    breadcrumb "#{t('helpers.submit.new')} #{IndividualRegistration.model_name.human}", new_individual_registration_path
    @individual_registration = IndividualRegistration.new(individual_registration_params)

    if @individual_registration.save
      redirect_to @individual_registration, notice: 'Individual registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /individual_registrations/1
  def update
    breadcrumb @individual_registration.slug, individual_registration_path(@individual_registration)
    if @individual_registration.update(individual_registration_params)
      redirect_to @individual_registration, notice: 'Individual registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /individual_registrations/1
  def destroy
    @individual_registration.destroy
    redirect_to individual_registrations_url, notice: 'Individual registration was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_individual_registration
    @individual_registration = IndividualRegistration.friendly.find(params[:id])
    @occupation_selected = @individual_registration.sociodemographic_info.occupation.presence
  end

  # Only allow a trusted parameter "white list" through.
  def individual_registration_params
    params.require(:individual_registration).permit(:health_condition_id,
                                                    :in_street_situation_id,
                                                    :family_member_id,
                                                    :sociodemographic_info_id,
                                                    :cancel_registration_id,
                                                    :refuse_registration,
                                                    :form_updated, :uuid,
                                                    :uuid_form_origin,
                                                    :uuid_citizen,
                                                    :tp_cds_origin,
                                                    family_member_attributes: %i[
                                                      id
                                                      family_id
                                                      social_name
                                                      city_id
                                                      birth_date
                                                      unknown_mother
                                                      mother_name
                                                      email
                                                      nationality_id
                                                      name
                                                      cns_number
                                                      cns_responsible
                                                      phone
                                                      pis_pasep_number
                                                      birth_country_id
                                                      race_id
                                                      gender_id
                                                      responsible
                                                      ethnicity_id
                                                      unknown_father
                                                      father_name
                                                      naturalized_at
                                                      naturalize_decree
                                                      brazil_entry_date
                                                      micro_area
                                                      out_area
                                                    ],
                                                    health_condition_attributes: %i[
                                                      id
                                                      hospitalization_cause
                                                      other_condition_one
                                                      other_condition_two
                                                      other_condition_three
                                                      medicinal_plants_used
                                                      maternity_reference
                                                      weight_situation_id
                                                      alcohol_dependent
                                                      other_drugs_dependent
                                                      smoker
                                                      pregnant
                                                      bedridden
                                                      domiciled
                                                      diabetic
                                                      respiratory
                                                      hypertension
                                                      cancer
                                                      kidneys
                                                      leprosy
                                                      tuberculosis
                                                      avc_stroke
                                                      had_heart_attack
                                                      had_heart_disease
                                                      recently_hospitalized
                                                      mental_issue
                                                      integrative_practices
                                                      medicinal_plants
                                                    ],
                                                    in_street_situation_attributes: [
                                                      :id,
                                                      :kinship_degree,
                                                      :other_accompanied,
                                                      :meals_per_day_id,
                                                      :has_other_accompanied,
                                                      :familiar_reference,
                                                      :receive_benefits,
                                                      :in_street_situation,
                                                      :has_personal_hygiene,
                                                      :family_visit,
                                                      :street_situation_time_id,
                                                      in_street_hygiene_accesses_attributes: %i[
                                                        id
                                                        hygiene_access_id
                                                        _destroy
                                                      ]
                                                    ],
                                                    sociodemographic_info_attributes: [
                                                      :id,
                                                      :education_level_id,
                                                      :occupation_id,
                                                      :sexual_orientation_id,
                                                      :traditional_community_name,
                                                      :parent_relation_id,
                                                      :job_market_situation_id,
                                                      :desire_orientation,
                                                      :attend_folk_healer,
                                                      :traditional_community,
                                                      :attend_school,
                                                      :community_group,
                                                      :health_plan,
                                                      :has_any_disability,
                                                      :desire_gender,
                                                      :gender_identity_id,
                                                      family_member_disabilities_attributes: %i[
                                                        id
                                                        disability_id
                                                        _destroy
                                                      ]
                                                    ],
                                                    cancel_registration_attributes: %i[
                                                      id
                                                      left_reason_id
                                                      decease_date
                                                      decease_number
                                                    ]).merge(company: current_user.company)
  end
end
