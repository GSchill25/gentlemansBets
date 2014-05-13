GentlemansBets::Application.routes.draw do
  get "members/index"
  get "members/sshow"
  get "members/edit"
  get "members/new"
  get "bet/index"
  get "bet/show"
  get "bet/edit"
  get "bet/new"
  get "bet/create"
  get "bet/update"
  get "bet/destroy"
  resources :bets
  resources :members

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  # set the root url
  root to: 'bet#index'
end

