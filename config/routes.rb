# -*- encoding : utf-8 -*-
RhodesPc2::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => 'pages#landing'
  get "/pages/*id" => 'pages#show', :as => :page, :format => false

  match "/pages/glenn", :id => 'glenn'
  match "/pages/heather", :id => 'heather'

  get "/admin" => 'admin/news#index'

  namespace :admin do
    resources :news
    resources :events
    resources :people
  end

  resources :news
  resources :events do
    member do
      get "download"
    end
  end
  resources :people
  
  resources :contacts do
    collection do
      post "send_form_information"
    end
  end
end
