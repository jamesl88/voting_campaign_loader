Velti::Application.routes.draw do
  resources :campaigns do
    member do
      get :candidates
    end
  end

  get "votes/index"
  root "campaigns#index"
end
