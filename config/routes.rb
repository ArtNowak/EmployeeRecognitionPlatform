# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :employees
  devise_for :admin_users
  resources :kudos
  
  namespace :admin do
    resources :pages do
      get :dashboard, on: :collection
    end
  end
  
  #resources :admin_users do
  #  get :dashboard, on: :collection
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
