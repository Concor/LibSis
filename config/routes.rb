Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :libraries do
	resources :books
	resources :workers
	resources :subscribers
	resources :issues
  end
 
  root 'libraries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end