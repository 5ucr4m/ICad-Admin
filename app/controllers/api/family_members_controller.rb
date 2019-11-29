# frozen_string_literal: true

module Api
  class FamilyMembersController < Api::ApiController
    load_and_authorize_resource find_by: :slug
    before_action :set_family_member, only: %i[show update destroy]

    # GET /family_members
    def index
      @query = FamilyMember.ransack(params[:q])
      @family_members = @query.result.includes(:family)
      if params[:family_id]
        @family_members = @family_members.where(family_id: params[:family_id])
      end
      render_json @family_members
    end

    # GET /family_members/1
    def show
      render_json @family_member
    end

    # POST /family_members
    def create
      @family_member = FamilyMember.new(family_member_params)

      if @family_member.save
        render_json @family_member, :created
      else
        unprocessable_entity @family_member
      end
    end

    # PATCH/PUT /family_members/1
    def update
      if @family_member.update(family_member_params)
        render_json @family_member, :ok, true
      else
        unprocessable_entity @family_member
      end
    end

    # DELETE /family_members/1
    def destroy
      @family_member.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family_member
      @family_member = FamilyMember.friendly.find(params[:id])
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
end
