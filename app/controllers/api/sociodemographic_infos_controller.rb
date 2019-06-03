# frozen_string_literal: true

module Api
  class SociodemographicInfosController < Api::ApiController
    before_action :set_sociodemographic_info, only: %i[show update destroy]

    # GET /sociodemographic_infos/1
    def show;
    end

    # POST /sociodemographic_infos
    def create
      @sociodemographic_info = SociodemographicInfo.new(sociodemographic_info_params)

      if @sociodemographic_info.save
        render_json @sociodemographic_info, :created
      else
        unprocessable_entity @sociodemographic_info
      end
    end

    # PATCH/PUT /sociodemographic_infos/1
    def update
      if @sociodemographic_info.update(sociodemographic_info_params)
        render_json @sociodemographic_info, :ok, true
      else
        unprocessable_entity @sociodemographic_info
      end
    end

    # DELETE /sociodemographic_infos/1
    def destroy
      @sociodemographic_info.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_sociodemographic_info
      @sociodemographic_info = if params[:individual_registration_id]
                                 SociodemographicInfo.find_by(individual_registration_id: params[:individual_registration_id])
                               else
                                 SociodemographicInfo.friendly.find(params[:id])
                               end
    end

    # Only allow a trusted parameter "white list" through.
    def sociodemographic_info_params
      params.require(:sociodemographic_info).permit(:education_level_id,
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
      )
    end
  end
end
