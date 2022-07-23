class PaymentController < PermissionsController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[show update destroy]

  def create
    @ad = current_user
    @user = User.find(params[:user_id])
    #  byebug
    @contract = Contract.where(id: params[:contract_id], user_id: params[:user_id])
    puts @contract
    # check is the user in the params is in the contract
    if @contract.exists?
      # create payment
      @payment = Payment.new(payment_params.merge(user: @ad.id))
      @payment.contract = @contract
      @payment.user = @user
      @payment.save
      render json: @payment, status: :created
    # update contract
    # @contract.update(payment_status: true)

    else
      render json: { error: "User not in contract" }, status: :unprocessable_entity
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
end
