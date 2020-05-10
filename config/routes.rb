Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'users/:id/show', to: 'users#show', as: :user
  post 'tweet', to: 'home#create'
  post 'follow/:id', to: 'users#follow_user', as: :follow
  delete 'unfollow/:id', to: 'users#unfollow_user', as: :unfollow
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
