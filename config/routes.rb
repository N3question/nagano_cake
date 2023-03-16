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
    
    # 商品に対して（カート内に入る）数量を結びつける。(ネストする)
    # params[:item_id]でItemのidが取得可能
    # get '/cart_items', to: 'cart_items#index', as: 'cart_items'
    resources :items, only: [:index, :show] # do
      delete '/cart_items/destroy_all'
      # resource :cart_item, only: [ :update, :destroy, :create]
    # end
    resources :cart_items, only: [:index, :create, :destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
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