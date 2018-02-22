Rails.application.routes.draw do
  resources :damages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "attack/:damage_hp/id/:id", to: "damages#attack"
end
