Rails.application.routes.draw do
  
  resources :artists do
    resources :albums
  end
  
  resources :albums do
    resources :tracks
  end
  
end
