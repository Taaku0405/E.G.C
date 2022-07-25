Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  root to: "public/homes#top"
   get "public/homes/about"
   get "public/homes/guide"

   namespace :admin do
   resources :users, only: [:index, :show, :edit, :update]

   resources :genres

   resources :posts, except: [:create] do
     resources :post_comments, only: [:destroy]
   end

   get "search" => "searches#search"
  end

   scope module: :public do
    resources :users, only: [:index, :show, :edit, :update ] do
    # 退会確認画面
    get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    # 論理削除用のルーティング
    patch "/users/:id/withdrawal" => "users#withdrawal", as: "withdrawal"
    member do
      get :favorites
    end

    resource :relationships, only: [:create, :destroy]
  	 get 'followings' => 'relationships#followings', as: 'followings'
  	 get 'followers' => 'relationships#followers', as: 'followers'
  	end

   resources :posts do
     resources :post_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
     get :search, on: :collection
  end

     resources :groups, except: [:destroy] do
       resource :group_users, only: [:create, :destroy]
       resources :event_notices, only: [:new, :create]
       resources :chats, except: [:edit]
       get "event_notices" => "event_notices#sent"
     end

      get 'search' => 'searches#search'
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
