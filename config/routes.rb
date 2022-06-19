Rails.application.routes.draw do
  devise_for :shops
  root 'homes#top'
end
