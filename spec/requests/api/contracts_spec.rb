require 'swagger_helper'

RSpec.describe 'api/contracts', type: :request do
  context "when as an admin" do
    path "/api/contracts" do
      post "Create a contract" do
        tags "Contracts"
        consumes "application/json"
        security [bearer_auth: {}]
        parameter name: :contract, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            user_id: { type: :integer },
            company_id: { type: :integer }
          },
          required: %w[name user_id company_id]
        }
        response "201", "contract created" do
          let(:contract) { { name: "Contract 1", user_id: 1, company_id: 1 } }
          run_test!
        end

        response "422", "invalid request" do
          let(:contract) { { name: "Contract 1", user_id: 1, company_id: 1 } }
          run_test!
        end
      end
    end

    path "/api/contracts/{id}" do
      put "Update a contract" do
        tags "Contracts"
        consumes "application/json"
        security [bearer_auth: {}]
        parameter name: :id, in: :path, type: :string
        parameter name: :contract, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            user_id: { type: :integer },
            company_id: { type: :integer }
          },
          required: %w[name user_id company_id]
        }
        response "200", "contract updated" do
          let(:contract) { { name: "Contract 1", user_id: 1, company_id: 1 } }
          run_test!
        end

        response "422", "invalid request" do
          let(:contract) { { name: "Contract 1", user_id: 1, company_id: 1 } }
          run_test!
        end
      end
    end
  end
end
