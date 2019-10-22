require 'pagy'
require "initializers/pagy"

module Commentui
  # Your code goes here...
  require "commentui/engine"
  require "commentui/version"
  require "commentui/shared_helper"

  def self.configure
    yield self
  end

  # The current user (devise current_user helper)
  mattr_accessor :current_user_lambda

  # The flag allow modify comment or not
  mattr_accessor :allow_modify_comment

  # The flag allow destroy comment or not
  mattr_accessor :allow_modify_destroy
end #
