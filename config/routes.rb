Commentui::Engine.routes.draw do
  resources :threads, only: [:show] do
    resources :comments
  end
end
