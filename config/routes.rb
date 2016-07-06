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
  root "battles#index"  
end
