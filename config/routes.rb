GentlemansBets::Application.routes.draw do
  resources :bets
  resources :members
  resources :sessions

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  get 'pending' => 'bets#pending', :as => :pending
  post 'accept' => 'bets#accept', :as => :accept

  # set the root url
  root to: 'bets#index'
end

