Rails.application.routes.draw do
  scope '/api/v1' do
    # category
    get 'categories', to: "categories#index"
    get 'categories/:id', to: "categories#show"
    post 'categories', to: "categories#create"
    put 'categories/:id', to: "categories#update"
    delete 'categories/:id', to: "categories#destroy"

    # product
    get 'products', to: 'products#index'
    get 'products/:id', to: 'products#show'
    post 'products', to: 'products#create'
    put 'products/:id', to: 'products#update'
    delete 'products/:id', to: 'products#destroy'

    # order
    get 'orders', to: 'orders#index'
    get 'orders/:id', to: 'orders#index'
    post 'orders', to: 'orders#create'
    put 'orders/:id', to: 'orders#update'
    delete 'orders/:id', to: 'orders#destroy'
  end
end
