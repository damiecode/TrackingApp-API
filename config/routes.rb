Rails.application.routes.draw do
  devise_for :users
  get 'savings/index'
  root 'static#index'
  namespace :api, defaults: {format: :json} do
    namespace :vi do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete :logout, to: 'sessions#logout'
        get :logged_in, to: 'sessions#logged_in'
      end
      get 'category/get_categories'
      resources :expenses, only: [:create, :index, :update]
    end
  end
end