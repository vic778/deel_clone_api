class ContractDetailsController < PermissionsController
  before_action :authenticate_user!
  before_action :set_contract_detail, only: %i[show update]

  def create
    @contract_detail = ContractDetail.create(contract_detail_params.merge(contract_id: params[:contract_id]))
    if @contract_detail.save
      render json: @contract_detail, status: :created
    else
      render json: @contract_detail.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contract_detail.update(contract_detail_params)
      render json: @contract_detail, status: :ok
    else
      render json: @contract_detail.errors, status: :unprocessable_entity
    end
  end

  private

  def set_contract_detail
    @contract_detail = ContractDetail.find(params[:id])
  end

  def contract_detail_params
    params.permit(:contract_name, :contractor_residence, :job_title, :description, :start_date, :over_date)
  end
end
