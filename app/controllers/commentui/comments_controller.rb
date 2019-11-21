require_dependency "commentui/application_controller"

module Commentui
  class CommentsController < ApplicationController
    include Pagy::Backend

    before_action :set_comment, :check_user, only: [:update, :destroy]
    after_action { pagy_headers_merge(@pagy) if @pagy }

    def index
      @comments = comments_scope.includes(:creator, :editor)
                                .order(order_opts)
      @pagy, @comments = pagy(@comments, items: params[:items])
      render json: @comments
    end

    def create
      @comment = comments_scope.new(comment_params)
      @comment.creator = commentui_user
      return render json: @comment if @comment.save

      render_json_errors(@comment.errors.full_messages)
    end

    def update
      @comment.assign_attributes(content: comment_params[:content])
      @comment.editor = commentui_user
      return render json: @comment if @comment.save

      render_json_errors(@comment.errors.full_messages)
    end

    def destroy
      render json: @comment.destroy
    end

    private

    def topic
      @topic ||= Commentui::Topic.find(params[:topic_id])
    end

    def comments_scope
      @comments_scope ||= topic.comments
      @comments_scope = @comments_scope.where(parent_id: params[:parent_id]) if params[:parent_id].present?
      @comments_scope
    end

    def set_comment
      @comment ||= Commentui::Comment.find(params[:id])
    end

    def comment_params
      params.fetch(:comment, {})
            .permit(
              :content,
              :parent_id,
            )
    end

    def check_user
      return if @comment.can_modify?(commentui_user)
      render_json_errors("Permission denied")
    end

    def order_opts
      Commentui.comment_orders_by
    end
  end #
end ##
