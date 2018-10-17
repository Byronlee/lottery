Rails.application.routes.draw do

  resources :users do
    get :success, on: :collection
    get :get_all_phones, on: :collection
  end

  resources :dashboard do
    get :gifts, on: :collection
    get :start, on: :collection
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
