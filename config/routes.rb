Brewbeck::Application.routes.draw do
    devise_for :users
    resources :beer
    resources :brewery

    get "/brewery/poll_breweries", to: "brewery#poll_breweries"
    post "/brewery/poll_breweries", to: "brewery#poll_breweries"

    root :to => "beer#index"
end