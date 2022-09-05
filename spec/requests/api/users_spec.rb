require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/api/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            },
            required: %w[username email password password_confirmation]
          }
        },
        required: ['user']
      }

      response '201', 'user created' do
        let(:user) { { user: { username: 'victor', email: 'barhvictor@gmail.com', password: '123456', password_confirmation: '123456' } } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { user: { email: 'foo' } } }
        run_test!
      end
    end

    path '/api/users/login' do
      post 'Logs in a user' do
        tags 'Users'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string }
              },
              required: %w[email password]
            }
          },
          required: ['user']
        }

        response '200', 'user logged in' do
          let(:user) { { user: { email: 'barhvictor@gmil.com', password: '123456' } } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:user) { { user: { email: 'foo' } } }
          run_test!
        end
      end
    end

    path '/api/users/{id}' do
      get 'Retrieves a user' do
        tags 'Users'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'user found' do
          schema type: :object,
                 properties: {
                   user: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       username: { type: :string },
                       email: { type: :string },
                       created_at: { type: :string },
                       updated_at: { type: :string }
                     }
                   }
                 },
                 required: %w[id username email created_at updated_at]

          let(:id) { User.create(username: 'victor', email: 'barhvictor@gmail.com', password: '123456', password_confirmation: '123456').id }
          run_test!
        end

        response '404', 'user not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
