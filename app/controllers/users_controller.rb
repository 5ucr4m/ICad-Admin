# frozen_string_literal: true

class UsersController < WebController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @query = User.ransack(params[:q])
    @pagy, @users = pagy(@query.result, page: params[:page])
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
    @user.build_health_professional
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)
    @cbo_selected = @user&.health_professional&.cbo_code&.presence

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.friendly.find(current_user.id)
    @cbo_selected = @user&.health_professional&.cbo_code&.presence
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 health_professional_attributes: %i[
                                   id
                                   cns_code
                                   cbo_code_id
                                   legal_full_name
                                   fancy_name
                                   federal_registry
                                   state_registry
                                   health_establishment_id
                                   professional_team_id
                                 ])
  end
end
