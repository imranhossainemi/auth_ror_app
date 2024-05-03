Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users


  # Defines the root path route ("/")
  root "admin#index"
  
  resources :admin, only: [:index] do
    member do
      put :block
      put :unblock
      delete :destroy
    end
  end
end
