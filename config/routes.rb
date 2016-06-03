Rails.application.routes.draw do
  resources :battles do 
    post "add_user" => "battle_members#create"
    resources :challenges
  end
  resources :groups

  post "login" => "users#login"
  root "battles#index"  
end
