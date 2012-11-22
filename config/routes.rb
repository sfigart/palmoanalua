PalMoanalua::Application.routes.draw do
  resources :registrations do
    member do
      get 'thankyou'
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "registrations#new"
  devise_for :users
  resources :users
end