Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "home#top"

  get 'home' => 'home#top'
  
  get 'post/new' => 'post#new'
  get 'post/edit' => 'post#edit'
  get 'post/delete' => 'post#delete'
  
  post 'post/create' => 'post#create'
  post 'post/update' => 'post#update'
  post 'post/createconfirm' => 'post#createconfirm'
  
  

  

  
 
end
