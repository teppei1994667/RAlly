Rails.application.routes.draw do
  get 'shops/index'
  devise_for :shops
  resources :shops, :only => [:show]
  root 'homes#top'
end
