Rails.application.routes.draw do
  root 'application#index'

  get 'login', to: 'sessions#new'
  get 'register', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'update-password', to: 'users#password'
  patch 'update-password', to: 'users#update_password'

  resources :users, except:[:new]

  resources :recipes do
    resources :ingredients, shallow:true
    resources :ratings, only: [:create, :new]
  end

  resources :categories, only:[:index, :show]


  # resources :recipes do
  #   resources :ratings, shallow: true
  # end
end
