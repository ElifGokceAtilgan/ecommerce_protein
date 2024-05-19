Rails.application.routes.draw do

  root to: redirect('/graphiql')

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "graphql", to:"graphql#execute"


  resources :products do
    get 'index'
    get 'show'
    post 'create'
  end

  # resources :products, only: :index
  resources :customers do
    get 'index'
    get 'show'
    post 'create'
    patch 'update'
    get '/recent_orders', to: 'customers#recent_orders'
  end

  resources :orders, only: [:create]

  post '/register', to: 'registrations#create'

end
