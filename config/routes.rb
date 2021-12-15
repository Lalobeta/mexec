Rails.application.routes.draw do
  
  root to: 'inventarios#index'

  get 'inventarios/index' => 'invetarios#index'
  get 'inventarios/create' => 'inventarios#create'
  get 'inventarios/read/:id_cliente', to: 'inventarios#read'
  get 'inventarios/update/:id', to: 'inventarios#update'
  post 'inventarios/insert' => 'inventarios#insert'
  post 'inventarios/edit/:id', to: 'inventarios#edit'
  post 'inventarios/delete/:id', to: 'inventarios#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
