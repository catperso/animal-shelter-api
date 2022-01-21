Rails.application.routes.draw do
  concern :api_base do
    get 'animals/random' => 'animals#random'
    resources :animals
  end

  namespace :v1 do
    concerns :api_base
  end


  # get 'animals/random' => 'animals#random'
  # resources :animals
end