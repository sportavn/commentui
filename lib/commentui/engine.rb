module Commentui
  class Engine < ::Rails::Engine
    isolate_namespace Commentui

    config.generators do |g|
      g.test_framework :rspec
      g.factory_bot dir: "spec/factories", suffix: "factory"
    end
  end
end
