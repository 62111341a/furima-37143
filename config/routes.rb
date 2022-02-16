Rails.application.routes.draw do
  devise_for :users
   root to: "items#index"
   resources :items, only: [:create] do

end
end