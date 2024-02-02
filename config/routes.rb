Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'

  get '/members/get_doctors', to: 'members#get_doctors', format: :json
  get '/members/get_patients', to: 'members#get_patients', format: :json


  patch '/opportunities/:id/update_stage', to: 'opportunities#update_stage', format: :json

  resources :members, format: :json
  resources :opportunities, format: :json
end
