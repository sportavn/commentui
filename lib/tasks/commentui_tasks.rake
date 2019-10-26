namespace :commentui do
  namespace :install do
    desc "Copy initializers from commentui to the host application"
    # rake commentui:install:initializers
    task :initializers do
      Dir.glob(File.expand_path('../../config/initializers/*.rb', __dir__)) do |file|
        if File.exists?(File.expand_path(File.basename(file), 'config/initializers'))
          print "NOTE: Initializer #{File.basename(file)} from commentui has been skipped. Initializer with the same name already exists.\n"
        else
          cp file, 'config/initializers', verbose: false
          print "Copied initializer #{File.basename(file)} from commentui\n"
        end
      end
    end
  end
end
