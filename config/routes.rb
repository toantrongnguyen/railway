Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'signup', to: 'users#new'
  get 'login', to: 'home#index'
  resources :users
  resources :movies do
    delete 'thumbnails/:thumbnail_id', to: 'movies#destroy_thumbnail', as: :delete_thumbnail
  end
  resources :actors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
