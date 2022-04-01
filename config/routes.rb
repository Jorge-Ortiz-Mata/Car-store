Rails.application.routes.draw do
  resources :vehicles
  get 'omniauth_test', to: 'home#display_omniauth'

  devise_for :users, controllers: {
                                    omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions'
                                  }
  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
  end


  authenticated(:user) do
    root "vehicles#index", as: :authenticated_root
  end
  
  unauthenticated(:user) do
    root "pages#home"
  end

  get 'pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
