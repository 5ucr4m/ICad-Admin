# frozen_string_literal: true

module Api
  class ResponsibleChildrenController < Api::ApiController
    load_and_authorize_resource
    before_action :set_responsible_child, only: %i[show update destroy]

    # GET /responsible_children/1
    def show
      render_json @responsible_child
    end

    # POST /responsible_children
    def create
      @responsible_child = ResponsibleChild.new(responsible_child_params)

      if @responsible_child.save
        render_json @responsible_child, :created
      else
        unprocessable_entity @responsible_child
      end
    end

    # PATCH/PUT /responsible_children/1
    def update
      if @responsible_child.update(responsible_child_params)
        render_json @responsible_child, :ok, true
      else
        unprocessable_entity @responsible_child
      end
    end

    # DELETE /responsible_children/1
    def destroy
      @responsible_child.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_responsible_child
      @responsible_child = if params[:individual_registration_id]
                             ResponsibleChild
                                             .find_by(individual_registration_id: params[:individual_registration_id])
                           else
                             ResponsibleChild.friendly.find(params[:id])
                           end
    end

    # Only allow a trusted parameter "white list" through.
    def responsible_child_params
      params.require(:responsible_child).permit(:id,
                                                :individual_registration_id,
                                                :responsible_children_type_id)
    end
  end
end
