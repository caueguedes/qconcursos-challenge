Rails.application.routes.draw do
  resources :questions, only: [:index, :show] do
    collection do
      get '/list/:filter', to: 'questions#list', as: 'list'
    end
  end
end
