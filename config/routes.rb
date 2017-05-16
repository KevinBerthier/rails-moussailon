Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  get  "/edit-profile", to: "users#edit"
  patch  "/edit-profile", to: "users#update"
  get "/dashboard", to: "users#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only:[:new, :create, :show, :edit]
  end
end
