Inventory::Application.routes.draw do
  root :to => 'welcome#index'
  resources :items
  resources :orders do
    member do
      post   'add_item'
      put    'update_item'
      delete 'delete_item'
    end
  end
end
