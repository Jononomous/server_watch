ServerWatch::Application.routes.draw do
  devise_for :users

  root :to => 'servers#index'

  resources :server_infos
  resources :server_logs
  resources :log_events
  resources :users
  resources :servers do
    collection do
      get :fetch_log
    end
  end
end
