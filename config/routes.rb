Rails.application.routes.draw do
  
  resources :themes
  resources :favorites, only:[create, :destroy]
  

  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
end
