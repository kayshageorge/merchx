Rails.application.routes.draw do


  resources :users do
    resources :products do
      resources :skus
    end
  end

  resources :tokens, only: [:create]

end
