Rails.application.routes.draw do
  resources :reminders do
    collection do
      get 'statistics'
      get 'search'
    end
  end

  get '/about', to: 'pages#about', as: 'about'
  get '/rules', to: 'pages#rules', as: 'rules'
  
  # Root route
  root "reminders#index"
end