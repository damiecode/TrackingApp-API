Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  get 'category/get_categories'
  resources :expenses, only: [:create, :index, :update]
 
  root 'static#index'
end
