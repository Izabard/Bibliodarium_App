Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'

  get '/edit', to: 'users#edit'

  post '/signup', to: 'users#create'

  resources :users do
    resources :books, only: [:index]
  end

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :books

  get '/edit', to: 'books#edit'
end
