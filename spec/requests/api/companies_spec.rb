require 'swagger_helper'

RSpec.describe 'api/companies', type: :request do
    context "when as an admin" do
        path '/api/companies' do
            post 'Creates a company' do
                tags 'Companies'
                consumes 'application/json'
                security [Bearer: []]
                
                parameter name: :company, in: :body, schema: {
                    type: :object,
                    properties: {
                        company: {
                            type: :object,
                            properties: {
                                legal_name: { type: :string },
                                company_type: { type: :string },
                                phone_number: { type: :string },
                                registration_number: { type: :string },
                                vat_id: { type: :string }
                               
                            }
                        }
                    }
                }

                response '201', 'company created' do
                    let(:company) { { company: attributes_for(:company) } }
                    run_test!
                end

                response '422', 'invalid request' do
                    let(:company) { { company: attributes_for(:company, :invalid) } }
                    run_test!
                end
            end
        end
        
    end
    
end
