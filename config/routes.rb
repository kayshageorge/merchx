Rails.application.routes.draw do

  resources :users do
    resources :products
  end

  resources :tokens, only: [:create]

end
