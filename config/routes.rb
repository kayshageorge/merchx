Rails.application.routes.draw do


  resources :customers, shallow: true do
    resources :orders do
      resources :line_items
    end
  end

  resources :users, shallow: true do
    resources :products do
      resources :skus
    end
  end

  post '/users/search', to: "users#search"
  post '/skus/search', to: "skus#search"

  resources :tokens, only: [:create]

  match "*unmatched_route", to: "application#not_found", via: :all;

end
