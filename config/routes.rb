Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users
  patch 'admin/block/:id', to: 'admin#block', as: 'block_user'
  patch 'admin/unblock/:id', to: 'admin#unblock', as: 'unblock_user'

  # Defines the root path route ("/")
  root "admin#index"
  
  resources :admin, only: [:index] do
    member do
      patch :block
      patch :unblock
      delete :destroy
    end
  end
end
