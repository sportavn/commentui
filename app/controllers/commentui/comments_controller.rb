require_dependency "commentui/application_controller"

module Commentui
  class CommentsController < ApplicationController
    before_action :set_thread
    # after_action { pagy_headers_merge(@pagy) if @pagy }

    include Pagy::Backend

    def index
      @pagy, @comments = pagy(comments_scope)
      render json: @comments
    end

    private

    def set_thread
      @thread ||= Commentui::Thread.find(params[:thread_id])
    end

    def comments_scope
      @thread.comments.order(created_at: :asc)
    end
  end ##
end #
