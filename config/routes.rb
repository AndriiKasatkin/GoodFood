Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :contacts, only: [:new, :create]
  post '/sendform', to: 'contacts#sendmail'
end