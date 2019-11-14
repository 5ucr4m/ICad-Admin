# frozen_string_literal: true

class PeriodItemsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_period_item, only: %i[show]

  # GET /period_items/1
  def show
    breadcrumb @period_item.slug, period_item_path(@period_item)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_period_item
    @period_item = PeriodItem.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def period_item_params
    params.require(:period_item).permit(:competence, :start_date, :end_date, :deadline)
  end
end
