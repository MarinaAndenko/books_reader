Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :books
  get 'drafts' => "books#drafts"
  get 'user_books' => "books#user_books"
  get 'admin/add_genre' => 'admin#add_genre', as: 'add_genre'
  get 'admin/edit_user_role' => "admin#edit_user_role", as: 'edit_user_role'
  post 'admin/edit_user_role' => "admin#update_user_role"
  resources :genres, only: [:new, :create, :destroy]
end
