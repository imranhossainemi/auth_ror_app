Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users
  post 'admin/ban/:id', to: 'admin#ban_user', as: 'admin_ban_user'
  post 'admin/unban/:id', to: 'admin#unban_user', as: 'admin_unban_user'

  # Defines the root path route ("/")
  root "admin#index"
  
  resources :admin, only: [:index] do
    member do
      post :ban_user
      post :unban_user
      delete :destroy
    end
  end
end
