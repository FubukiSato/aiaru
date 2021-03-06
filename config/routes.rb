Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "home#explain"

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'


  get 'home/explain' => 'home#explain'
  get 'home' => 'home#top'
  get 'home/detail/:id' => 'home#detail'
  
  get 'post/new' => 'post#new'
  get 'post/edit' => 'post#edit'

  get 'admin/post/admin_delete/:id' => 'admin/post#admin_delete'

  get 'post/delete' => 'post#delete'
  
  post 'post/create' => 'post#create'
  post 'post/update' => 'post#update'
  post 'post/createconfirm' => 'post#createconfirm'
  
  

  

  
 
end
