ServerWatch::Application.routes.draw do
  devise_for :users

  root :to => 'servers#index'
end
