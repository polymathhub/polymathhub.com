Rails.application.routes.draw do

  get 'home/index'
  get 'welcome/index'

  resources :projects do
    resources :discussions do
      resources :comments
    end
  end

  devise_for :members, controllers: {
    sessions: 'members/sessions'
  }

  root 'home#index'

  #this makes emails available at localhost:3000/letter_opener
  mount LetterOpenerWeb::Engine, at: '/letter_opener' #if Rails.env.development?
end
