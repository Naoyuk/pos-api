Rails.application.routes.draw do
  scope '/api/v1' do
    # category routes
    get 'categories', to: "categories#index"
    get 'categories/:id', to: "categories#show"
    post 'categories', to: "categories#create"
    put 'categories/:id', to: "categories#update"
    delete 'categories/:id', to: "categories#destroy"

    # product routes
    get 'products', to: 'products#index'
    get 'products/:id', to: 'products#show'
    post 'products', to: 'products#create'
    put 'products/:id', to: 'products#update'
    delete 'products/:id', to: 'products#destroy'
  end
end
