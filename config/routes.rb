Rails.application.routes.draw do
  resources :config_tags, except: :update
  resources :categories, except: :update
  resources :votes, except: :update
  resources :configs do
    delete 'vote', module: 'configs', to: 'configs/votes#destroy'
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "overrides/omniauth_callbacks",
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'me', to: 'users#me'
end
