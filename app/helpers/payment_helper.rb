module PaymentHelper
  # check if the user in the parms exist in the contract
  def check_user_in_contract(user_id, contract_id)
    @contract = Contract.find(contract_id)
    @user = User.find(user_id)
    @contract.users.include?(@user)
  end

  # check if the user has already paid
  def check_user_paid(user_id, contract_id)
    @payment = Payment.where(user_id: user_id, contract_id: contract_id)
    !@payment.empty?
  end

  # create payment
  def create_payment(user_id, contract_id, amount)
    @payment = Payment.new(user_id: user_id, contract_id: contract_id, amount: amount)
    @payment.save
  end

  # update contract
  def update_contract(contract_id)
    @contract = Contract.find(contract_id)
    @contract.update(payment_status: true)
  end
end
