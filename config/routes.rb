Rails.application.routes.draw do
  resources :questions, only: [:index, :show]

  root to: "questions#index"
end
