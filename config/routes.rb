# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'welcome#index'

  mount HealthMonitor::Engine, at: '/'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: 'dev/emails'
  end

  concern :with_datatable do
    post 'datatable', on: :collection
  end

  ### All routes below this point should require login or API key ###
  authenticate :user, lambda { |u| u.admin? } do
    mount Logster::Web, at: 'logs'
    mount Sidekiq::Web, at: 'sidekiq'
  end

  devise_for :users, module: 'authentication',
              skip_helpers: [:registrations],
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  as :user do
    get   'my/password', to: 'authentication/registrations#edit',   as: 'edit_user_registration'
    patch 'my/password', to: 'authentication/registrations#update', as: 'user_registration'
  end

  scope 'my' do
    match 'account', to: 'my#account', as: 'my_account', via: [:get, :patch]
  end

  resources :mailing_lists

  namespace :admin do
    root to: 'welcome#index', as: 'root'

    resources :settings, only: [:index]
    resources :users, except: [:show], concerns: [:with_datatable] do
      member do
        get   'change_password'
        patch 'update_password'
      end
    end
  end
end
