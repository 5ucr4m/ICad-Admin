# frozen_string_literal: true

class StatesController < WebController
  before_action :set_state, only: %i[show edit update destroy]

  # GET /states
  def index
    @query = State.ransack(params[:q])
    @pagy, @states = pagy(@query.result, page: params[:page])
  end

  # GET /states/1
  def show; end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit; end

  # POST /states
  def create
    @state = State.new(state_params)

    if @state.save
      redirect_to @state, notice: 'State was successfully created.', status: :created
    else
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      redirect_to @state, notice: 'State was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
    redirect_to states_url, notice: 'State was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def state_params
    params.require(:state).permit(:name, :abbreviation, :code, :reference, :slug)
  end
end
