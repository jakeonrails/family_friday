Rails.application.routes.draw do

  resources :groups, only: [:index]
  resources :team_members

  root to: 'groups#index'
end
