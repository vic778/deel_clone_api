class CompaniesController < PermissionsController
  before_action :authenticate_user!
  before_action :set_company, only: %i[update destroy]

  def index
    @profile = Profile.where(user_id: current_user.id).first
    @companies = @profile.companies
    render json: @companies
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def create
    @profile = Profile.where(user_id: current_user.id).first
    @company = @profile.companies.create(company_params.merge(profile_id: @profile.id))
    if @company.save
      render json: { success: true, message: "Company created successfully", company: @company }, status: :created
    else
      render json: { success: false, message: "Company could not be created", errors: @company.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: { success: true, message: "Company updated successfully", company: @company }, status: :ok
    else
      render json: { success: false, message: "Company could not be updated", errors: @company.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    render json: { success: true, message: "Company deleted successfully" }, status: :ok
  end

  private

  def set_company
    @profile = Profile.where(user_id: current_user.id).first
    @company = @profile.companies.find(params[:id])
  end

  def company_params
    params.permit(:legal_name, :company_type, :registration_number, :phone_number, :vat_id)
  end
end
