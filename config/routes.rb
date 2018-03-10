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

  resources :tokens, only: [:create]

end
