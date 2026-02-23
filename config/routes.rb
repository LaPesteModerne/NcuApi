Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'api/list', to: 'main_pages#list', defaults: { format: :json }
  get 'api/page/:id', to: 'main_pages#page', defaults: { format: :json }
  get 'api/side/:id', to: 'side_panel#side', defaults: { format: :json }
  post 'api/edit/:id', to: 'edition#add_or_edit', defaults: { format: :json }
  post 'api/check_id', to: 'general#check_id', defaults: { format: :json }
  delete 'api/delete/:id', to: 'edition#delete', defaults: { format: :json }
end
