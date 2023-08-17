Rails.application.routes.draw do
get "search", to: "blogs#search"
  devise_for :users
  resources :blogs do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root "blogs#index"
  
  get "commentshow" ,to: "comments#show" 
  get "my_blog", to: "blogs#my_blog"
  post "like" , to: "blogs#like"
  get "like" , to: "blogs#like"
  post "anilc", to: "comments#collapse"
  get "mylike", to: "blogs#mylike"
  get "/", to: "blogs#index"
  # delete "commentshow" , to: "comments#destroy"
end
