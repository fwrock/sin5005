Rails.application.routes.draw do
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'home#index'  
  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  #get  '/contact', to: 'static_pages#contact'
  get  '/contact', to: 'messages#new'
  
  resources :users
  resources :products
  resources :categories
  resources :messages

end
