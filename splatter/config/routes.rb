Splatter::Application.routes.draw do
  resources :splatts
  resources :users
  
  put 'users/:id' => 'users#update', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/ }
  get 'users/splatts/:id' => 'users#splatts', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/}
  get 'users/follow/:id' => 'users#show_follows', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/ }
  get 'users/follower/:id' => 'users#show_followers', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/ }
  post 'users/follows' => 'users#add_follows'
  delete 'users/follows/:id/:followed_id' => 'users#delete_follows', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/, :followed_id => /[0-9A-Za-z\-\.\@]+/}
  get 'users/splatts-feed/:id' => 'users#splatts_feed', :constraints => {:id => /[0-9A-Za-z\-\.\@]+/ }
  delete 'splatts/:id/:user_id' => 'splatts#destroy', :constraints => {:user_id => /[0-9A-Za-z\-\.\@]+/ }
  
end
