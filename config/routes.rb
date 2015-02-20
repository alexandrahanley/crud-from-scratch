Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  post '/number_of_likes' => 'posts#number_of_likes'

end
