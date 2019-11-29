# frozen_string_literal: true

class SmsSchedulesController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_sms_schedule, only: %i[show edit update destroy send_sms_messages]

  breadcrumb SmsSchedule.model_name.human(count: 2), :sms_schedules_path

  # GET /sms_schedules
  def index
    @query = SmsSchedule.ransack(params[:q])
    @pagy, @sms_schedules = pagy(@query.result.includes(:taggings), page: params[:page], items: 10)
  end

  # GET /sms_schedules/1
  def show
    breadcrumb @sms_schedule.slug, sms_schedule_path(@sms_schedule)
  end

  # GET /sms_schedules/new
  def new
    breadcrumb t('helpers.submit.new'), new_sms_schedule_path
    @sms_schedule = SmsSchedule.new
  end

  # GET /sms_schedules/1/edit
  def edit
    breadcrumb @sms_schedule.slug, sms_schedule_path(@sms_schedule)
  end

  # POST /sms_schedules
  def create
    breadcrumb t('helpers.submit.new'), new_sms_schedule_path
    @sms_schedule = SmsSchedule.new(sms_schedule_params)

    if @sms_schedule.save
      redirect_to @sms_schedule, notice: 'Sms schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sms_schedules/1
  def update
    breadcrumb @sms_schedule.slug, sms_schedule_path(@sms_schedule)
    if @sms_schedule.update(sms_schedule_params)
      redirect_to @sms_schedule, notice: 'Sms schedule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sms_schedules/1
  def destroy
    @sms_schedule.destroy
    redirect_to sms_schedules_url, notice: 'Sms schedule was successfully destroyed.'
  end

  def send_sms_messages
    SmsScheduleJob.perform_later(@sms_schedule)
    render_json({ message: 'Lote de SMS enviado com sucesso!' }, :ok)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sms_schedule
    @sms_schedule = SmsSchedule.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sms_schedule_params
    params.require(:sms_schedule).permit(:name, :scheduled_date, :message, :status, role_list: [])
  end
end
