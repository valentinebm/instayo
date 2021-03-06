Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users

  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end

  root 'posts#index'

  get ':username', to: 'profiles#show', as: :profile

  get ':username/edit', to: 'profiles#edit', as: :edit_profile

  patch ':username/edit', to: 'profiles#update', as: :update_profile
end
