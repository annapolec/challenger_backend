Rails.application.routes.draw do
  devise_for :users
  resources :battles do 
    post "add_user" => "battle_members#create"
    resources :challenges
  end
  resources :groups
  resources :group_users
  resources :battle_members
  resources :challenge_members  

  post "login" => "users#login"
  post "refresh_token" => "refresh_token#create"
  get "sync" => "sync#show"
  root "battles#index"  
end
