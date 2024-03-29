Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

 scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions, confirmations: :confirmations },
                       path_names: { sign_in: :login }

    resource :user, only: [:update]
    get 'user/auto_login', to: 'users#auto_login'
    get 'users', to: 'users#index'

    resources :contracts do
      resources :contract_details, only: [:create, :update]
    end

    resources :companies
    resources :payment
    resources :dashboard

   
  end
end
