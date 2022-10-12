class PaymentController < PermissionsController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[show update destroy]
  before_action :check_use_in_contract, only: %i[create]

  def create
    @user = User.find(params[:user_id])
    #  byebug
    @contract = Contract.find(params[:contract_id])
    @payment = Payment.new(payment_params)
    @payment.contract = @contract
    @payment.user = @user
    if @payment.save
      render json: @payment, status: :created
    # @contract.update(payment_status: true)
    else
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end

    # Rails.logger.debug "PaymentController#create: #{@contract.inspect}"
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.permit(:amount, :contract_id, :user_id)
  end

  def check_use_in_contract
    @user = User.find(params[:user_id])
    @contract = Contract.find(params[:contract_id])
    render json: { errors: 'You do not have a contract with this user' }, status: :unprocessable_entity if @contract.user != @user
  end
end
