Brewbeck::Application.routes.draw do
    resources :beer
    root :to => "beer#index"
end