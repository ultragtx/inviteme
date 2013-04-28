Inviteme::Application.routes.draw do
  resources :invite_codes


  resources :invite_items


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'high_voltage/pages#show', :id => 'welcome'

end