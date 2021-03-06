Rails.application.routes.draw do
  
  get 'static_pages/secret'
  
  devise_for :users
  resources :event do
  	resources :avatars, only: [:create]
  end
  resources :attendance
  resources :charges, only: [:new, :create]
  root 'event#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
