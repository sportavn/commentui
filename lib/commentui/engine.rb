module Commentui
  class Engine < ::Rails::Engine
    isolate_namespace Commentui

    ActiveSupport.on_load(:action_controller_base) do
      include SharedHelper
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
