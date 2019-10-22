Commentui.configure do |config|
  config.current_user_lambda = ->(context) { context.current_user }
  config.allow_modify_comment = true
  config.allow_modify_destroy = false
end
