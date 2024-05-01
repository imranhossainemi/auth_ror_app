Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users


  # Defines the root path route ("/")
  root "admin#index"
end
