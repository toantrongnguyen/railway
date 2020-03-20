Rails.application.routes.draw do
  root 'home#index'
  get 'home/faq'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  resources :users
  resources :movies do
    delete 'thumbnails/:thumbnail_id', to: 'movies#destroy_thumbnail', as: :delete_thumbnail
  end
  resources :actors
  resources :account_activations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
