# frozen_string_literal: true

class FamilyMembersController < WebController
  before_action :set_family_member, only: %i[show edit update destroy]

  # GET /family_members
  def index
    @query = FamilyMember.ransack(params[:q])
    @pagy, @family_members = pagy(@query.result, page: params[:page])
  end

  # GET /family_members/1
  def show; end

  # GET /family_members/new
  def new
    @family_member = FamilyMember.new
  end

  # GET /family_members/1/edit
  def edit; end

  # POST /family_members
  def create
    @family_member = FamilyMember.new(family_member_params)

    if @family_member.save
      redirect_to @family_member, notice: 'Family member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /family_members/1
  def update
    if @family_member.update(family_member_params)
      redirect_to @family_member, notice: 'Family member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /family_members/1
  def destroy
    @family_member.destroy
    redirect_to family_members_url, notice: 'Family member was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_family_member
    @family_member = FamilyMember.friendly.find(params[:id])
    @city_selected = @family_member.city.presence
  end

  # Only allow a trusted parameter "white list" through.
  def family_member_params
    params.require(:family_member).permit(:family_id, :social_name, :city_id,
                                          :birth_date, :unknown_mother, :mother_name,
                                          :email, :nationality_id, :name, :cns_number,
                                          :cns_responsible, :phone, :pis_pasep_number,
                                          :birth_country_id, :race_id, :gender_id,
                                          :responsible, :ethnicity_id, :unknown_father,
                                          :father_name, :naturalized_at, :naturalize_decree,
                                          :brazil_entry_date, :micro_area, :out_area)
  end
end
