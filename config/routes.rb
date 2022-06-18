Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
   get "public/homes/about"

   namespace :admin do
   resources :users, only: [:index, :show, :edit, :update]

   resources :genres, only: [:index, :create, :edit, :update]

   resources :posts, except: [:create]

   get "search" => "searches#search"
  end

   scope module: :public do
    resources :users, only: [:index, :show, :edit, :update ]
    # 退会確認画面
    get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    # 論理削除用のルーティング
    patch "/users/:id/withdrawal" => "users#withdrawal", as: "withdrawal"

   resources :posts do
     resources :post_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
     get :search, on: :collection
  end

     resources :groups, except: [:destroy] do
       resource :group_users, only: [:create, :destroy]
       resources :event_notices, only: [:new, :create]
       get "event_notices" => "event_notices#sent"
     end

      get 'search' => 'searches#search'
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
