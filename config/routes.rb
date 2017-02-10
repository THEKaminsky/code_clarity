Rails.application.routes.draw do
  devise_for :users
  get :complete, to: 'shared#complete'

  root 'shared#index'

  resources :questions do
    resources :attempts, only: [:create, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
