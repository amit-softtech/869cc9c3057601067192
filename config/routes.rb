Rails.application.routes.draw do
  resources :topics do
  	member do
  	  get :follow	
  	end
  end

  devise_for :users
  resources :questions do
  	resources :answers
  	member do
  	  post :follow_user
  	  post :follow_topic	
  	end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
end
