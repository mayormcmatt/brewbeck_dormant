Brewbeck::Application.routes.draw do
  get "poll/show"
    devise_for :users
    resources :beer
    resources :brewery

    get "/poll/poll_breweries", to: "poll#show"
    post "/poll/poll_breweries", to: "poll#show"

    root :to => "beer#index"
end