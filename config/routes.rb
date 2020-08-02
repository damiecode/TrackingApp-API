Rails.application.routes.draw do
  root 'static#index'
  get 'expenses/index'
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
