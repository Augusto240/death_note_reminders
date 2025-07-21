Rails.application.routes.draw do
  resources :reminders do
    collection do
      get 'search'
    end
  end
  
  get '/about', to: 'pages#about', as: 'about'
  
  root "reminders#index"
end