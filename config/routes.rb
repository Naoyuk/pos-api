Rails.application.routes.draw do
  scope '/api/v1' do
    resources :categories
  end
  # get 'categories/index'
  # get 'categories/new'
  # post 'categories/create'
  # put 'categories/:id/update'
  # delete 'categories/:id/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
