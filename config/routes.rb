Rails.application.routes.draw do
  resources :comments
  devise_for :users
  get 'welcome/index'
  resources :recipes do
 	member do
 		put "like", to: "recipes#upvote"
 		put "dislike", to: "recipes#downvote"
 	end
 	resources :comments
  end

  authenticated :user do
	  root "recipes#index", as: "authenticated_root"
	end

 root "welcome#index"
end