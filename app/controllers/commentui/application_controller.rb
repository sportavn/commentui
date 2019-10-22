class Commentui::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_commentui_user

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def render_json_errors(errors, status=:unprocessable_entity)
    errors = [errors] unless errors.instance_of?(Array)
    render json: {
      errors: errors
    }, status: status
  end

  def record_not_found
    render_json_errors("Record not found", :not_found)
  end

  def set_commentui_user
    return if commentui_user.present?
    render_json_errors("Permission denied")
  end
end
