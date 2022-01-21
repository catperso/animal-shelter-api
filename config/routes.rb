Rails.application.routes.draw do
  get 'animals/random' => 'animals#random'
  resources :animals
end