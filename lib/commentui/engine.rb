module Commentui
  class Engine < ::Rails::Engine
    isolate_namespace Commentui

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
