Rails.application.routes.draw do
  resources :tweets, only: %i(index create destroy)
  get 'home/index'
  get 'sign_up_done', to: 'home#sign_up_done'

  # ルーティングをカスタマイズする場合は、まず skip でルーティング生成をスキップする
  devise_for :users, skip: [:sessions, :registrations], controllers: {
      registrations: 'users/registrations'
  }

  # skip したルーティングをここでカスタマイズする
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

    # コントローラをカスタマイズした場合は、以下もカスタマイズしたほうを見るようにする
    get 'sign_up', to: 'users/registrations#new', as: :new_user_registration
    post 'sign_up', to: 'users/registrations#create', as: :user_registration
  end

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  root to: 'tweets#index'
end
