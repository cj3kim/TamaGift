TamaGift::Application.routes.draw do
  root to: 'users#home'

  devise_for :users
  resources :users
end
