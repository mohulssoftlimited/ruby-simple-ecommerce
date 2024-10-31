Rails.application.routes.draw do
  get 'static_pages/about'
  
  # Set the root path to the breed groups index
  root "breed_groups#index"

  resources :categories do
    resources :products, only: [:index, :show]
  end

  resources :products, only: [:index, :show]

  resources :breed_groups, only: [:index, :show] do
    resources :breeds, only: [:index, :show] do
      resources :breed_comments, only: [:create]  # Nest comments under breeds
    end
  end

  resources :breed_groups do
    resources :breeds do
      resources :breed_comments, only: [:create]
    end
  end

  get 'about-us', to: 'static_pages#about'
end
