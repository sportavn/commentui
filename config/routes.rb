Commentui::Engine.routes.draw do
  resources :threads, only: [:show] do
    comment_resources = [:index, :show, :create]
    comment_resources << :update if Commentui.allow_modify_comment
    comment_resources << :destroy if Commentui.allow_modify_destroy
    resources :comments, only: comment_resources
  end
end
