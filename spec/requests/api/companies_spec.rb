require 'swagger_helper'

RSpec.describe 'api/companies', type: :request do
  context "when as an admin" do
    path "/api/companies" do
      post "Create a company" do
        tags "Companies"
        consumes "application/json"
        security [bearer_auth: {}]
        parameter name: :company, in: :body, schema: {
          type: :object,
          properties: {
            legal_name: { type: :string },
            company_type: { type: :string },
            registration_number: { type: :integer },
            phone_number: { type: :string },
            vat_id: { type: :string }
          },
          required: %w[legal_name company_type registration_number phone_number vat_id]
        }
        response "201", "company created" do
          let(:company) { { legal_name: "Company 1", company_type: "Sole Proprietorship", registration_number: 123_456_789, phone_number: "123456789", vat_id: "123456789" } }
          run_test!
        end

        response "422", "invalid request" do
          let(:company) { { name: "Company 1", address: "123 Main St", city: "City", state: "State", zip: "12345", phone: "123-456-7890" } }
          run_test!
        end
      end
    end
  end
end
