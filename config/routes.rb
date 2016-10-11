Rails.application.routes.draw do


  get 'meetup/new'

  get 'meetup/edit'

  get 'meetup/index'

  get 'meetup/show'

  CMxSL::Application.routes.draw do
  
  get 'meetup/new'

  get 'meetup/edit'

  get 'meetup/index'

  get 'meetup/show'

    resources :contacts, only: [:index]
    resources :lists, only: [:index]
    get 'dashboard' => 'dashboard#welcome', as: :dashboard

  end

    resources :lists
    resources :contacts
    resources :users
    resources :events
    resources :groups



    get 'sign_in' => 'sessions#new', as: :sign_in
    post 'sign_in' => 'sessions#create'
    delete 'sign_in' => 'sessions#delete', as: :end_session
    get 'sign_out' => 'sessions#delete', as: :sign_out

    root 'welcome#hello'
end
