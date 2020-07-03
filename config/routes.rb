Rails.application.routes.draw do
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/current_user", to: "sessions#show"
    post "/signup", to: "users#create"
    
    resources :visits, only: [:index, :create, :update, :destroy] do
        resources :reviews, only: [:index]
    end
    
    resources :parks, only: [:index] do
        resources :reviews, only: [:index]
    end
end
