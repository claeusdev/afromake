Rails.application.routes.draw do
  get 'user/show'
  devise_for :users



  resources	:forum_threads do
  	resources :posts, module: :forum_threads
  end


  root 'pages#index'
end
