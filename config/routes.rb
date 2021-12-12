Rails.application.routes.draw do
  resources :projects do
    resources :floorplans
  end
end
