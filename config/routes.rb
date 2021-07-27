Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'post/new' => 'post#new'
  get 'post/edit' => 'post#edit'
  get 'post/deleteconfirm' => 'post#deleteconfirm'
  post 'post/create' => 'post#create'
  post 'post/update' => 'post#update'

  get 'post/delete' => 'post#delete'
  
  

  get 'home' => 'home#top'

  root to: "home#top"

  
 
end
