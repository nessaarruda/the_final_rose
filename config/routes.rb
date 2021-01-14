Rails.application.routes.draw do
  resources :bachelorettes do
    resources :contestants, controller: 'bachelorette/contestants', only: [:index, :show]
  end
    resources :bachelorettes
    resources :outings
    resources :contestants, only: [:show]
end
