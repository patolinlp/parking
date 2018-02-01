Rails.application.routes.draw do
  root 'welcome#index'

  resources :reserves
  get '/reserves/exit/:id', :to=>'reserves#exit', :as => :exit_reserve
  get '/reserves/reservePdf/:id', :to=>'reserves#reservePdf', :as => :pdf_reserve

  resources :vehicles
  resources :slots
  resources :vehicle_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
