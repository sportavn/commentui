require 'pagy'
require "initializers/pagy"

module Commentui
  # Your code goes here...
  require "commentui/engine"
  require "commentui/version"
  require "commentui/acts_as_commentuier"
  require "commentui/acts_as_commentuiable"

  ActiveSupport.on_load(:active_record) do
    include ActsAsCommentuier
    include ActsAsCommentuiable
  end

  def self.configure
    yield self
  end

  # The current user (devise current_user helper)
  mattr_accessor :base_controller
  @@base_controller = ActionController::Base

  # The current user (devise current_user helper)
  mattr_accessor :current_user_lambda
  @@current_user_lambda = ->(context) { context.current_user }

  # The flag allow modify comment or not
  mattr_accessor :allow_modify_comment
  @@allow_modify_comment = true

  # The flag allow destroy comment or not
  mattr_accessor :allow_modify_destroy
  @@allow_modify_destroy = true

  # The flag allow reply comment or not
  mattr_accessor :comment_orders_by
  @@comment_orders_by = { created_at: :asc }
end #
