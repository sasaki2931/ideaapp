Rails.application.routes.draw do
  root to: "themes#index"
  resources :themes
  

  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
end
