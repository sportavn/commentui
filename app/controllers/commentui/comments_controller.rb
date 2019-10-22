require_dependency "commentui/application_controller"

module Commentui
  class CommentsController < ApplicationController
    include Pagy::Backend

    before_action :set_thread
    before_action :set_comment, only: [:update, :destroy]
    before_action :check_user, only: [:update, :destroy]
    after_action { pagy_headers_merge(@pagy) if @pagy }

    def index
      @comments = comments_scope.includes(:creator, :editor)
      @pagy, @comments = pagy(@comments)
      render json: @comments
    end

    def create
      @comment = comments_scope.new(comment_params)
      @comment.creator = commentui_user
      return render json: @comment if @comment.save

      render_json_errors(@comment.errors.full_messages)
    end

    def update
      @comment.assign_attributes(comment_params)
      @comment.editor = commentui_user
      return render json: @comment if @comment.save

      render_json_errors(@comment.errors.full_messages)
    end

    def destroy
      return render json: @comment if @comment.destroy

      render_json_errors(@comment.errors.full_messages)
    end

    private

    def set_thread
      @thread ||= Commentui::Thread.find(params[:thread_id])
    end

    def comments_scope
      @thread.comments.order(created_at: :asc)
    end

    def set_comment
      @comment ||= comments_scope.find(params[:id])
    end

    def comment_params
      params.fetch(:comment, {})
            .permit(:content)
    end

    def check_user
      return if @comment.can_modify?(commentui_user)

      render_json_errors("Permission denied")
    end
  end ##
end #
