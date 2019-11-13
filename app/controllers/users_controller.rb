# frozen_string_literal: true

class UsersController < WebController
  load_and_authorize_resource
  before_action :set_user, only: %i[show edit update destroy]

  breadcrumb User.model_name.human(count: 2), :users_path

  # GET /users
  def index
    @query = User.ransack(params[:q])
    @pagy, @users = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /users/1
  def show
    breadcrumb @user.slug, user_path(@user)
  end

  # GET /users/new
  def new
    breadcrumb "#{t('helpers.submit.new')} #{User.model_name.human}", new_user_path
    @user = User.new
    @user.build_health_professional
  end

  # GET /users/1/edit
  def edit
    breadcrumb @user.slug, user_path(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:avatar])
    @cbo_selected = @user&.health_professional&.cbo_code&.presence

    if @user.save
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      @user.avatar.attach(params[:avatar]) unless @user.avatar.attached?
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      @cbo_selected = @user&.health_professional&.cbo_code&.presence
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
    @user.build_health_professional unless @user&.health_professional&.persisted?
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :avatar,
                                 health_professional_attributes: %i[
                                   id
                                   cns_code
                                   cbo_code_id
                                   full_name
                                   fancy_name
                                   federal_registry
                                   state_registry
                                   health_establishment_id
                                   professional_team_id
                                 ],
                                 user_companies_attributes: [
                                   :id,
                                   :user_id,
                                   :company_id,
                                   :current,
                                   :_destroy,
                                   user_roles_attributes: %i[
                                     id
                                     role_id
                                   ]
                                 ])
  end
end
