Brewbeck::Application.routes.draw do
  get "poll_breweries/show"
  get "poll/show"
    devise_for :users
    resources :beer
    resources :brewery

    get "/poll/poll_breweries", to: "poll_breweries#show"
    post "/poll/poll_breweries", to: "poll_breweries#show"

    get "/poll/poll_beers", to: "poll_beers#show"
    post "/poll/poll_beers", to: "poll_beers#show"

    root :to => "beer#index"
end