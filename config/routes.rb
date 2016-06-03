Rails.application.routes.draw do
  resources :battles do 
    resources :challenges
  end
  resources :groups
  post "login" => "users#login"
  root "battles#index"  
end
