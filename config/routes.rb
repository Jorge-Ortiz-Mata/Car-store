Rails.application.routes.draw do

    patch 'change_to_admin', to: 'roles#change_to_admin'
    patch 'change_to_member', to: 'roles#change_to_member'
    patch 'change_to_other', to: 'roles#change_to_other'

    resources :posts do
        resources :post_wizard, controller: 'posts/post_wizard'
    end
    resources :youtube, only: :show

    post 'buy_product', to: 'orders#buy_product'
    delete 'remove_product', to: 'orders#remove_product'
    post 'add_to_cart', to: 'orders#add_to_cart'

    resources :profiles do
        get 'my_cart', to: 'orders#my_cart'
    end

    resources :vehicles, except: [:update, :edit] do
        resources :comments, except: [:index, :show]
        resources :vehicle_wizard, controller: 'vehicles/vehicle_wizard'
    end
        
    delete 'delete_media', to: 'vehicles#delete_video_and_video_thumbnail'

    get 'omniauth_test', to: 'home#display_omniauth'

    devise_for :users, controllers: {
                                        omniauth_callbacks: 'users/omniauth_callbacks',
                                        sessions: 'users/sessions',
                                        registrations: "users/registrations"
                                    }
    devise_scope :user do
        get 'sign_out' => 'devise/sessions#destroy'
    end

    match "/404", to: "errors#not_found_page", via: :all
    match "/500", to: "errors#internal_server_error", via: :all

    authenticated(:user) do
        root "vehicles#index", as: :authenticated_root
    end
    
    unauthenticated(:user) do
        root "pages#home"
    end

    get 'privacy', to: 'pages#privacy'
end
