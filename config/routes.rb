Rails.application.routes.draw do

  root 'gifts#index'
  get '/login' => 'sessions#new'
  resource :session, only: [:create, :destroy]
  resources :users
  resources :nonprofits do
    resources :gifts
  end

  get '/gifts' => 'gifts#index'
  get '/profile' => 'sessions#index'
  get '/admin/users' => 'users#index'
  get '/gifts/individual' => 'gifts#individual'
  get '/gifts/business' => 'gifts#business'
  get '/all_nonprofits' => 'nonprofits#all_nonprofits'
  post '/gifts/search' => 'gifts#search'







end
