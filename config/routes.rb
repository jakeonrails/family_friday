Rails.application.routes.draw do

  resources :groups, only: [:index]
  resources :team_members do
    collection do
      post :reset
    end
  end

  root to: 'groups#index'
end
