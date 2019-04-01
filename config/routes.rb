Rails.application.routes.draw do
  resources :uniqs, only: [:new, :create]
  root to: 'uniqs#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
