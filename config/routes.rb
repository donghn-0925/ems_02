Rails.application.routes.draw do
  get "supervisor/index"
  root "session#new"
  get "trainee/index"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users  
end
