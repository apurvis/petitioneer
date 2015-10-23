Rails.application.routes.draw do
  root 'welcome#index'
  resources :welcome
  resources :petitions
end
