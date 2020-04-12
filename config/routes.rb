Rails.application.routes.draw do
  resources :tweets, only: %i(index create destroy)
  get 'home/index'
  get 'sign_up_done', to: 'home#sign_up_done'

  # ルーティングをカスタマイズする場合は、まず skip でルーティング生成をスキップする
  devise_for :users, skip: [:sessions, :registrations], controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
  }

  # skip したルーティングをここでカスタマイズする
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
    get 'current_user', to: 'users/sessions#fetch_current_user'

    # コントローラをカスタマイズした場合は、以下もカスタマイズしたほうを見るようにする
    get 'sign_up', to: 'users/registrations#new', as: :new_user_registration
    post 'sign_up', to: 'users/registrations#create', as: :user_registration
  end

  root to: 'tweets#index'
end
