Rails.application.routes.draw do
  get 'static_pages/about'
  get 'breeds/index'
  get 'breeds/show'
  get 'breed_groups/index'
  get 'breed_groups/show'
  
  # Set the root path to the breed groups index
  root "breed_groups#index"

  resources :categories do
    resources :products, only: [:index, :show]
  end

  resources :products, only: [:index, :show]

  resources :breed_groups, only: [:index, :show] do
    resources :breeds, only: [:index, :show]
  end



  get 'about-us', to: 'static_pages#about'
end
