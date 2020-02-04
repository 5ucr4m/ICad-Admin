# frozen_string_literal: true

class RolesController < WebController
  before_action :set_role, only: %i[show edit update destroy]

  breadcrumb Role.model_name.human(count: 2), :roles_path

  # GET /roles
  def index
    authorize(Role)
    @query = Role.ransack(params[:q])
    @pagy, @roles = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /roles/1
  def show
    authorize(@role)
  end

  # GET /roles/new
  def new
    authorize(Role)
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
    authorize(Role)
  end

  # POST /roles
  def create
    authorize(Role)
    @role = Role.new(role_params)

    if @role.save
      redirect_to(roles_url, notice: 'Role was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /roles/1
  def update
    authorize(@role)
    if @role.update(role_params)
      redirect_to(roles_url, notice: 'Role was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /roles/1
  def destroy
    authorize(@role)
    @role.destroy
    redirect_to(roles_url, notice: 'Role was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def role_params
    params.require(:role).permit(:name, :description, :role_type, :admin)
  end
end
