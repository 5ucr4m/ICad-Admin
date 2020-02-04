# frozen_string_literal: true

class StatesController < WebController
  before_action :set_state, only: %i[show edit update destroy]

  breadcrumb State.model_name.human(count: 2), :states_path

  # GET /states
  def index
    authorize(State)
    @query = State.ransack(params[:q])
    @pagy, @states = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /states/1
  def show
    authorize(@state)
  end

  # GET /states/new
  def new
    authorize(State)
    @state = State.new
  end

  # GET /states/1/edit
  def edit
    authorize(@state)
  end

  # POST /states
  def create
    authorize(State)
    @state = State.new(state_params)

    if @state.save
      redirect_to(states_url, notice: 'State was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /states/1
  def update
    authorize(@state)
    if @state.update(state_params)
      redirect_to(states_url, notice: 'State was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /states/1
  def destroy
    authorize(@state)
    @state.destroy
    redirect_to(states_url, notice: 'State was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def state_params
    params.require(:state).permit(:name, :abbreviation, :code, :reference, :country_id)
  end
end
