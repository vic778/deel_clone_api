class DashboardController < PermissionsController
    before_action :authenticate_user!


    def index
        @u = helpers.balance_display
        @c = helpers.contract_user
        @up = helpers.upcoming
        @pub = helpers.payment_pub
        @hist = helpers.payment_hist
        if @u 
            render json: { balance: @u, contract: @c, upcoming: @up, published: @pub, history: @hist }
        else
            render json: { error: "No contract" }, status: :unprocessable_entity
        end
    end

    def show
        @c = helpers.contract_details
        if @c 
            render json: { contract: @c }
        else
            render json: { error: "No contract" }, status: :unprocessable_entity
        end
    end

    def upcoming
        @up = helpers.upcoming
        if @up
            render json: { payment: @up }
        else
            render json: { error: "No contract" }, status: :unprocessable_entity
        end
    end

    def payment_pub
        @pub = helpers.payment_pub
        if @pub
            render json: { payment: @pub }
        else
            render json: { error: "No contract" }, status: :unprocessable_entity
        end
    end
end
