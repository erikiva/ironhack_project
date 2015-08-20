Rails.application.routes.draw do
  devise_for :users
  resources :events do
      resources :sections
      resources :guests do
        resources :rsvp
      end
      resources :rsvp_options
  end



  get 'sessions/new' => 'sessions#new'
  get 'sessions/create' => 'sessions#create'
  get 'sessions/destroy' => 'sessions#destroy'
  get 'users/index' => 'users#index'

  get 'users/new' => 'users#new'

  get 'users/create' => 'users#create'

  get 'users/show' => 'users#show'

  get 'users/profile' => 'users#profile'
  get '/guest/:hash' => 'guest#enter'
  root to: 'users#profile'

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
 end
