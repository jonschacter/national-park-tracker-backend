Rails.application.routes.draw do
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/current_user", to: "sessions#show"
end
