Brewbeck::Application.routes.draw do
    devise_for :users
    resources :beer
    root :to => "beer#index"
end