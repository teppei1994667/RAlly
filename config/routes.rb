Rails.application.routes.draw do
  root 'homes#top'
  get 'shops/index'
  devise_for :shops, controllers: {
    registrations: 'shops/registrations',
    sessions: 'shops/sessions'
  }
  resources :shops, :only => [:show] do
    resources :order_stores
  end
end
