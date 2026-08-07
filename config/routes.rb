Rails.application.routes.draw do
  resources :authors do
    resources :books
  end
get  "static_pages/home"
get  "static_pages/help"
   # root "authors#index"
   root "application#hello"
end
