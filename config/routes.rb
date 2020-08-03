Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    devise_for :users
    get 'savings/index'
    root 'static#index'
    namespace :api, defaults: {format: :json} do
      namespace :vi do
        devise_scope :user do
          post "sign_up", to: "registrations#create"
          post "logged_in", to: "sessions#create"
        end
        get 'category/get_categories'
        resources :expenses, only: [:create, :index, :update]
      end
    end
  end
end