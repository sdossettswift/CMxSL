Rails.application.routes.draw do
  resources :lists
  resources :contacts do
        collection {post :import}
    end
  resources :users
  resources :events
  resources :groups
  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete', as: :end_session
  get 'sign_out' => 'sessions#delete', as: :sign_out
  get 'dashboard' => 'dashboard#welcome', as: :dashboard
  root 'welcome#hello'
end
