# frozen_string_literal: true

class SmsSchedulesController < ApplicationController
  load_and_authorize_resource
  before_action :set_sms_schedule, only: %i[show edit update destroy]

  # GET /sms_schedules
  def index
    @query = SmsSchedule.ransack(params[:q])
    @pagy, @sms_schedules = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /sms_schedules/1
  def show; end

  # GET /sms_schedules/new
  def new
    @sms_schedule = SmsSchedule.new
  end

  # GET /sms_schedules/1/edit
  def edit; end

  # POST /sms_schedules
  def create
    @sms_schedule = SmsSchedule.new(sms_schedule_params)

    if @sms_schedule.save
      redirect_to @sms_schedule, notice: 'Sms schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sms_schedules/1
  def update
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sms_schedule
    @sms_schedule = SmsSchedule.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sms_schedule_params
    params.require(:sms_schedule).permit(:scheduled_date, :message, :group, :status)
  end
end
