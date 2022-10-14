# require 'swagger_helper'

# RSpec.describe 'api/contract_details', type: :request do
#   context "when as an admin" do
#     path "/api/contracts/1/contract_details" do
#       post "Create a contract detail" do
#         tags "Contract Details"
#         consumes "application/json"
#         security [bearer_auth: {}]
#         parameter name: :contract_detail, in: :body, schema: {
#           type: :object,
#           properties: {
#             contract_name: { type: :string },
#             contractor_residence: { type: :string },
#             job_title: { type: :string },
#             description: { type: :string },
#             start_date: { type: :string },
#             over_date: { type: :string }
#           },
#           required: %w[contract_id description quantity unit_price total_price]
#         }
#         response "201", "contract detail created" do
#           let(:contract_detail) { { contract_name: "Contract 1", contractor_residence: "123 Main St", job_title: "City", description: "State", start_date: "12345", over_date: "123-456-7890" } }
#           run_test!
#         end

#         response "422", "invalid request" do
#           let(:contract_detail) { { contract_id: 1, description: "Contract Detail 1", quantity: 1, unit_price: 1, total_price: 1 } }
#           run_test!
#         end
#       end
#     end

#     path "/api/contracts/1/contract_details/1" do
#       put "Update a contract detail" do
#         tags "Contract Details"
#         consumes "application/json"
#         security [bearer_auth: {}]
#         parameter name: :contract_detail, in: :body, schema: {
#           type: :object,
#           properties: {
#             contract_name: { type: :string },
#             contractor_residence: { type: :string },
#             job_title: { type: :string },
#             description: { type: :string },
#             start_date: { type: :string },
#             over_date: { type: :string }
#           },
#           required: %w[contract_id description quantity unit_price total_price]
#         }
#         response "200", "contract detail updated" do
#           let(:contract_detail) { { contract_name: "Contract 1", contractor_residence: "123 Main St", job_title: "City", description: "State", start_date: "12345", over_date: "123-456-7890" } }
#           run_test!
#         end

#         response "422", "invalid request" do
#           let(:contract_detail) { { contract_id: 1, description: "Contract Detail 1", quantity: 1, unit_price: 1, total_price: 1 } }
#           run_test!
#         end
#       end
#     end
#   end
# end
