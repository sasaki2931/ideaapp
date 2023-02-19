Rails.application.routes.draw do
  root to: "tops#index"
  get 'my_theme', to: 'themes#my_theme'
  resource :tops, only: [:show]
  resources :favorites, only: [:create, :destroy,:index]
  resources :themes do
    resources :ideas, only: [:create, :destroy,:new]
  end
  
  
  devise_for :users
  resources :users, only: [:show] do
    get 'favorites', on: :member
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
end
