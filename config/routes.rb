Rails.application.routes.draw do
  root 'landing#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users do
    resources :vouches
  end

  devise_scope :user do
    authenticated :user do
      root 'profile#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get '/profile', to: 'profile#index'

  get '/:username', to: 'users#show', as: 'user_profile', constraints: ->(request) { User.exists?(username: request.params[:username]) }

  # Catch-all route
  match '*path', to: 'errors#not_found', via: :all

end
