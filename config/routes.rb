Rails.application.routes.draw do
  get 'home/index'
  get 'home/sign_up_done'
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root to: 'home#index'
end
