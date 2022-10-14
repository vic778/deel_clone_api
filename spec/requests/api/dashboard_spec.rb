require 'swagger_helper'

RSpec.describe 'api/dashboard', type: :request do
  path "/api/dashboard" do
    get "Get dashboard data" do
      tags "Dashboard"
      consumes "application/json"
      security [bearer_auth: {}]
    
      response '201', 'successfully authenticated' do
        token = JWT.encode({ id: 1 }, 'vicSecret', 'HS256')
        let(:Authorization) { "Bearer #{token}" }
      end
    end
  end

  path "/api/dashboard/contracts" do
    get "Get the details of your contract" do
      tags "Dashboard"
      consumes "application/json"
      security [bearer_auth: {}]
      response "200", "dashboard contracts data" do
        let(:user) { create(:user, :admin) }
        let(:Authorization) { "Bearer #{@token}" }
       
      end
    end
  end

  path "/api/dashboard/upcoming" do
    get "See your upcoming payment" do
      tags "Dashboard"
      consumes "application/json"
      security [bearer_auth: {}]
      response "200", "dashboard upcoming data" do
        let(:user) { create(:user, :admin) }
        let(:Authorization) { "Bearer #{@token}" }
        # run_test!
      end
    end
  end
end
