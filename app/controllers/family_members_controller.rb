# frozen_string_literal: true

class FamilyMembersController < WebController
  before_action :set_family_member, only: %i[show edit update destroy]

  breadcrumb FamilyMember.model_name.human(count: 2), :family_members_path

  # GET /family_members
  def index
    @query = FamilyMember.ransack(params[:q])
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @family_members = pagy(@result.includes(:city, :race, :gender),
                                  page: params[:page], items: 10)
  end

  # GET /family_members/1
  def show
    breadcrumb @family_member.slug, family_member_path(@family_member)
  end

  # GET /family_members/new
  def new
    breadcrumb "#{t('helpers.submit.new')} #{FamilyMember.model_name.human}", new_family_member_path
    @family_member = FamilyMember.new
  end

  # GET /family_members/1/edit
  def edit
    breadcrumb @family_member.slug, family_member_path(@family_member)
  end

  # POST /family_members
  def create
    breadcrumb "#{t('helpers.submit.new')} #{FamilyMember.model_name.human}", new_family_member_path
    @family_member = current_user.family_members.new(family_member_params)
    set_selected_options

    if @family_member.save
      redirect_to @family_member, notice: 'Family member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /family_members/1
  def update
    breadcrumb @family_member.slug, family_member_path(@family_member)
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
    set_selected_options
  end

  def set_selected_options
    @city_selected = @family_member.city.presence
    @ethnicity_selected = @family_member.ethnicity.presence
    @family_selected = @family_member.family.presence
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
