RhodesPc2::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'high_voltage/pages#show', :id => 'landing'

  resources :contacts do
    collection do
      post "send_form_information"
    end
  end
end
