Rails.application.routes.draw do
  devise_for :users
  resources :battles do 
    post "add_user" => "battle_members#create"
    get "ranking" => "battle_ranking#show"
    resources :challenges
  end
  resources :groups
  resources :group_users
  resources :battle_members
  resources :challenge_members  

  post "login" => "users#login"
  get "ranking" => "ranking#show"
  post "refresh_token" => "refresh_token#create"
  get "sync" => "sync#show"
  authenticated :user do
    root :to => "battles#index", as: :authenticated_root
  end
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
