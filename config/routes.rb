Rails.application.routes.draw do
  root "categories#index"  # Set the root path to the categories index

  resources :categories do
    resources :products, only: [:index, :show]
  end

  resources :products, only: [:index, :show]
end