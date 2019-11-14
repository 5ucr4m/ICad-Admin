# frozen_string_literal: true

class PeriodItemsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_period_item, only: %i[show]

  breadcrumb PeriodItem.model_name.human(count: 2), :period_items_path

  # GET /period_items
  def index
    @period = Period.find_by(competence: "#{Time.current.month}/#{Time.current.year}")
    @query = current_user.period_items.where(period: @period).ransack(params[:q])
    @pagy, @period_items = pagy(@query.result.includes(:period), page: params[:page], items: 10)
  end

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
