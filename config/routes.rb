Rails.application.routes.draw do
  devise_for :users
  resources :links do
    member do
      put "like",    to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments, only: [:create, :edit, :destroy]
  end
  root 'links#index'
end
