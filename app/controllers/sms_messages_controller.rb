# frozen_string_literal: true

class SmsMessagesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :set_sms_message, only: %i[show edit update destroy]

  # GET /sms_messages
  def index
    @query = SmsMessage.ransack(params[:q])
    @pagy, @sms_messages = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /sms_messages/1
  def show; end

  # GET /sms_messages/new
  def new
    @sms_message = SmsMessage.new
  end

  # GET /sms_messages/1/edit
  def edit; end

  # POST /sms_messages
  def create
    @sms_message = SmsMessage.new(sms_message_params)

    if @sms_message.save
      redirect_to @sms_message, notice: 'Sms message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sms_messages/1
  def update
    if @sms_message.update(sms_message_params)
      redirect_to @sms_message, notice: 'Sms message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sms_messages/1
  def destroy
    @sms_message.destroy
    redirect_to sms_messages_url, notice: 'Sms message was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sms_message
    @sms_message = SmsMessage.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sms_message_params
    params.require(:sms_message).permit(:date_sent, :number, :status, :sms_schedule_id)
  end
end
