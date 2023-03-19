Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  ## devise関係①
  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  ## 個別のURL ②
  ## resources ③ ...採用順位が高いので下に持ってくる。
  scope module: :public do
    root "homes#top"
    get '/', to: 'homes#top', as: 'top'
    get '/about', to: 'homes#about', as: 'about'
    # カート機能ではネストしない！！
    delete '/cart_items/destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :items, only: [:index, :show]
    get '/customers/my_page', to: 'customers#show', as: 'my_page'
    get '/customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch '/customers/information', to: 'customers#update', as: 'information'
    get '/customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw', to: 'customers#withdraw', as: 'withdraw'
    post '/orders/comfirm', to: 'orders#comfirm', as: 'comfirm'
    get '/orders/complete', to: 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show] 
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
    
  
  namespace :admin do
    get '/', to: 'homes#top', as: 'top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy] # destroyは任意
    resources :customers, only: [:index, :show, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    patch '/order_details/:id', to: 'order_details#update', as: 'order_detail'
  end
  
end