# -*- encoding : utf-8 -*-
RhodesPc2::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'pages#show', :id => 'landing'
  get "/pages/*id" => 'pages#show', :as => :page, :format => false

  match "/pages/glenn", :id => 'glenn'
  match "/pages/heather", :id => 'heather'
  resources :contacts do
    collection do
      post "send_form_information"
    end
  end
end
