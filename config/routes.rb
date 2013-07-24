Firefight::Application.routes.draw do
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :registration => 'register' }

  resources :members
  resources :stat_groups
  resources :stats do
    collection do
      get :top_rankings
    end
  end

  get "home/index"
  get "home/about", as: "about"

  root :to => 'home#index'

end
