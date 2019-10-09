# frozen_string_literal: true

class FamiliesController < WebController
  load_and_authorize_resource
  before_action :set_family, only: %i[show edit update destroy]

  def chart_by_day
    render_json Family.by_company(current_user.company)
                      .group_by_period(:day, :created_at,
                                       format: '%d/%m/%Y', last: 5).count
  end

  # GET /families
  def index
    @query = Family.by_company(current_user.company).ransack(params[:q])
    respond_to do |format|
      format.html { @pagy, @families = pagy(@query.result.includes(:family_income), page: params[:page], items: 10) }
      format.json { render_json @query.result.includes(:company, :home_registration, :family_income) }
    end
  end

  # GET /families/1
  def show; end

  # GET /families/new
  def new
    @family = Family.new
    @family.family_members.build
    @family.build_relationships.build_relationships
  end

  # GET /families/1/edit
  def edit; end

  # POST /families
  def create
    @family = Family.new(family_params)
    @city_selected = @family&.home_registration&.address&.city.presence

    if @family.save
      redirect_to @family, notice: 'Family was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /families/1
  def update
    if @family.update(family_params)
      redirect_to @family, notice: 'Family was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy
    redirect_to families_url, notice: 'Family was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_family
    @family = Family.by_company(current_user.company).friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def family_params
    params.require(:family).permit(:responsible_birth_date,
                                   :responsible_cns_number,
                                   :members_quantity, :handbook_number,
                                   :family_income_id, :reside_since,
                                   :moving, :home_registration_id,
                                   :form_updated,
                                   :pet_quantity,
                                   :refuse_registration,
                                   :tp_cds_origin,
                                   :home_type_id,
                                   :finished,
                                   family_members_attributes: %i[
                                     id
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
                                   home_registration_attributes: [
                                     :id,
                                     :health_professional_id,
                                     :home_type_id,
                                     permanence_institution_attributes: %i[
                                       id
                                       name
                                       other_linked_professionals
                                       responsible_name
                                       responsible_cns
                                       institutional_role
                                       responsible_phone
                                     ],
                                     living_condition_attributes: %i[
                                       id
                                       water_supply_id
                                       rural_production_area_id
                                       garbage_disposal_id
                                       bathroom_drainage_id
                                       home_location_id
                                       home_wall_material_id
                                       rooms
                                       residents
                                       home_situation_id
                                       electric_power
                                       home_access_id
                                       home_type_id
                                       water_treatment_id
                                     ],
                                     address_attributes: %i[
                                       id
                                       address_type_id
                                       patio
                                       number
                                       zip
                                       complement
                                       district
                                       city_id
                                       referential_phone
                                       home_phone
                                       reference
                                       out_area
                                       micro_area
                                     ]
                                   ])
  end
end
