Rails.application.routes.draw do
  resources :artists do
    resources :albums do
      resources :tracks
    end
  end
  
end
