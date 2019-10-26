Commentui.configure do |config|
  # ===> base_controller will be inherit by commmentui's application controller
  # where your current_user is defined
  # Type: ActionController::Base relatives class
  # Defautl: ActionController::Base
  # config.base_controller = ActionController::Base

  # ===> current_user method of your system
  # Type: lambda
  # Params: current controller
  # Default: ->(context) { context.current_user }
  # config.current_user_lambda = ->(context) { context.current_user }

  # ===> allow_modify_comment should gem provides modify comments function
  # Defautl: true
  # config.allow_modify_comment = true

  # ===> allow_modify_destroy should gem provides destroy comments function
  # Defautl: true
  # config.allow_modify_destroy = true
end
