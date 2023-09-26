Rails.application.routes.draw do
  #顧客用
  #　URL　/customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get '/customers/withdrawal_check' => 'customers#withdrawal_check'
    patch '/customers/withdrawal' => "customers#withdrawal"
    get 'items/:id' => 'items#show', as: 'item'
    resources :items, only: [:index, :show]
    resource :customers, only: [:edit, :update]
  end
  namespace :admin do
   # get 'items/:id' => 'items#show', as: 'item'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
