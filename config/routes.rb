Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # namespace :public do
    # resource :customer, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    get '/customers/my_page', to: 'customers#show', as: 'my_page'
    get '/customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch '/customers/information', to: 'customers#update', as: 'information'
    get '/customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw', to: 'customers#withdraw', as: 'withdraw'
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/comfirm', to: 'orders#comfirm'
    get '/orders/complete', to: 'orders#complete'
    
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all'
    
    resources :items, only: [:index, :show]
    
    get '/', to: 'homes#top', as: 'top'
    get '/about', to: 'homes#about', as: 'about'
  # end
  
  namespace :admin do
    resources :orders, only: [:show, :update]
    
    resources :items, except: :destroy
    
    resources :customers, only: [:index, :show, :create, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    patch '/order_details/:id', to: 'order_details#update', as: 'order_detail'
    
    get '/', to: 'homes#top', as: 'top'
  end

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
  
end
