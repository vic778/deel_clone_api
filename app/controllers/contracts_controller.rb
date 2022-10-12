class ContractsController < PermissionsController
  before_action :authenticate_user
  before_action :set_contract, only: %i[show update destroy]
  before_action :check_employee, only: %i[create]

  def index
    @user = current_user
    @contracts = Contract.where(user_id: @user.id)

    render json: @contracts
  end

  def show
    render json: @contract
  end

  def create
    @user = current_user
    @company = Company.find_by_id(params[:company_id])
    @employee = User.find_by_id(params[:employee_id])
    @contract = @company.contracts.create(contract_params.merge(user_id: @user.id))
    # @contract = Contract.create(contract_params.merge(user: current_user))
    if @contract.save
      @employee.contracts << @contract
      render json: { success: true, message: "Contract created successfully", contract: @contract }
    else
      render json: { success: false, message: "Contract creation failed", errors: @contract.errors }
    end
  end

  def update
    if @contract.update(contract_params)
      render json: { success: true, message: "Contract updated successfully", contract: @contract }
    else
      render json: { success: false, message: "Contract update failed", errors: @contract.errors }
    end
  end

  def destroy
    if @contract.destroy
      render json: { success: true, message: "Contract deleted successfully" }
    else
      render json: { success: false, message: "Contract deletion failed" }
    end
  end

  private

  def set_contract
    @user = current_user
    @contract = @user.contracts.find(params[:id])
  end

  def contract_params
    params.permit(:name, :company_id, :employee_id)
  end

  def check_employee
    # check if the employee has ready the contract
    @employee = User.find_by_id(params[:employee_id])
    render json: { success: false, message: "Employee has already signed a contract" } if @employee.contracts.exists?
  end
end
