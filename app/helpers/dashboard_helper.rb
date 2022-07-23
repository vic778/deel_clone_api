module DashboardHelper

    #display the balance in the contract where the user is currently logged in
    def balance_display
        contract = Contract.where(user_id: current_user.id).first
        payment = Payment.where(contract_id: contract.id).first
    end

    def contract_user
        contract = Contract.where(user_id: current_user.id).first
    end

    def contract_details
        contract = Contract.where(user_id: current_user.id).first
        contract_details = ContractDetail.where(contract_id: contract.id).first
    end

    def hostori
        contract = Contract.where(user_id: current_user.id).all
        payment = Payment.where(contract_id: contract.id).all
    end

    def upcoming 
        contract = Contract.where(user_id: current_user.id)
        payment = Payment.where(user_id: current_user.id, status: 'pending')
    end

    def payment_pub
        contract = Contract.where(user_id: current_user.id)
        payment = Payment.where(user_id: current_user.id, status: 'published')
    end

    def payment_hist
        contract = Contract.where(user_id: current_user.id)
        payment = Payment.where(user_id: current_user.id).all
    end

end
