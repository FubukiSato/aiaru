Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'post/new' => 'post#new'
  post 'post/create' => 'post#create'

  get 'home' => 'home#top'

  root to: "home#top"

  
 
end
