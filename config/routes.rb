Rails.application.routes.draw do
  get 'pages/index'
    # Defines the root path route ("/")
  root "pages#index"

  resources :movies do
    # Agrego ruta search
    collection do
      get "search"
    end
  end

  resources :clients do
  # Agrego ruta search
  collection do
      get "search"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end