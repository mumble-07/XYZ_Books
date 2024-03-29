Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#index'
  get '/search' => 'static_pages#search'
  get '/books/:isbn' => 'static_pages#api_book'
  get '/convert/:isbn' => 'static_pages#convert_isbn'
  
end
