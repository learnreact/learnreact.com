require_relative 'boot'

require 'rails/all'
require 'rack/reverse_proxy'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LearnReact
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert(0, Rack::ReverseProxy) do
      if Rails.env.production?
        reverse_proxy_options preserve_host: true
        reverse_proxy '/changelog', 'https://learnreact.github.io/changelog/index.html'
      end
    end
  end
end
