Firefight::Application.routes.draw do
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :registration => 'register' }

  resources :members
  resources :stat_groups

  get "home/index"

  root :to => 'home#index'

end
