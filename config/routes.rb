Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, module: 'authentication',
              skip_helpers: [:registrations],
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  namespace :admin do
    root to: 'welcome#index', as: 'root'

    resources :users, except: [:show]
  end
end
