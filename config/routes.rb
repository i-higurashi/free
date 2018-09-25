Rails.application.routes.draw do

  get '/home' => 'homes#introduction'
  get '/sign' => 'homes#sign'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/topicuser/:id' => 'users#topicuser', as: 'topicuser'
  get '/top' => 'users#top', as: 'top'

  resources :genres


  resources :favorites

  resources :nices, only: [:destroy]
   get '/nices/:topic_id' => 'nices#create', as:'nices'

  resources :nicetwos, only: [:destroy]
   get '/nicetwos/:chat_id' => 'nicetwos#create', as:'nicetwos'


  resources :topics do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'

  end


  get '/follow/:id' => 'relationships#follow', as: 'follow'
  get '/follow_p/:id' => 'relationships#follow_p', as: 'follow_p'
  get '/followed_p/:id' => 'relationships#followed_p', as: 'followed_p'
  post 'chats/create' => 'chats#create', as: :chat_create


end