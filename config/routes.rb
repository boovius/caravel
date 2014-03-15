Caravel::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :users do
      post "/"       , action: 'create'
      get  "/",        action: 'index'
      get "/:id",      action: 'show'
      put "/:id",      action: 'update'
    end
  end

  get '/new' => 'users#new', :as => :signin
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout

  match '*path' => 'ng_view#index', via: [:get, :post]

  root to: 'ng_view#index'
end
