Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#root'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, expect: [:new]
end
