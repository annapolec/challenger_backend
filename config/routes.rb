Rails.application.routes.draw do
  resources :battles do 
    post "add_user" => "battle_members#create"
    resources :challenges
  end
  resources :groups

  post "login" => "users#login"
  post "refresh_token" => "refresh_token#create"
  get "sync" => "sync#show"
  root "battles#index"  
end
