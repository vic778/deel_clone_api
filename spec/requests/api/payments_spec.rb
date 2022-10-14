# require 'swagger_helper'

# RSpec.describe 'api/payments', type: :request do
#   context "when as an admin" do
#     path "/api/payments" do
#       post "Create a payment" do
#         tags "Payments"
#         consumes "application/json"
#         security [bearer_auth: {}]
#         parameter name: :payment, in: :body, schema: {
#           type: :object,
#           properties: {
#             contract_id: { type: :integer },
#             amount: { type: :integer },
#             payment_date: { type: :string },
#             payment_method: { type: :string },
#             payment_type: { type: :string },
#             payment_status: { type: :string },
#             payment_note: { type: :string }
#           },
#           required: %w[contract_id amount payment_date payment_method payment_type payment_status payment_note]
#         }
#         response "201", "payment created" do
#           let(:payment) { { contract_id: 1, amount: 1, payment_date: "2021-01-01", payment_method: "Cash", payment_type: "Down Payment", payment_status: "Paid", payment_note: "Down Payment" } }
#         end

#         response "422", "invalid request" do
#           let(:payment) { { contract_id: 1, amount: 1, payment_date: "2021-01-01", payment_method: "Cash", payment_type: "Down Payment", payment_status: "Paid", payment_note: "Down Payment" } }
#         end
#       end
#     end

#     path "/api/payments/1" do
#       put "Update a payment" do
#         tags "Payments"
#         consumes "application/json"
#         security [bearer_auth: {}]
#         parameter name: :payment, in: :body, schema: {
#           type: :object,
#           properties: {
#             contract_id: { type: :integer },
#             amount: { type: :integer },
#             payment_date: { type: :string },
#             payment_method: { type: :string },
#             payment_type: { type: :string },
#             payment_status: { type: :string },
#             payment_note: { type: :string }
#           }
#         }
#         response "200", "payment updated" do
#           let(:payment) { { contract_id: 1, amount: 1, payment_date: "2021-01-01", payment_method: "Cash", payment_type: "Down Payment", payment_status: "Paid", payment_note: "Down Payment" } }
#         end

#         response "422", "invalid request" do
#           let(:payment) { { contract_id: 1, amount: 1, payment_date: "2021-01-01", payment_method: "Cash", payment_type: "Down Payment", payment_status: "Paid", payment_note: "Down Payment" } }
#         end
#       end
#     end
#   end
# end
