Rails.application.routes.draw do
  root to: "themes#top"
  resources :users, only: [:show]
  resources :favorites, only: [:create, :destroy]
  resources :themes do
    resources :ideas, only: [:create, :destroy]
  end
  

  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
end
