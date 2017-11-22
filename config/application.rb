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
      reverse_proxy_options preserve_host: false
      if Rails.env.production? or Rails.env.staging?
        reverse_proxy_options force_ssl: true, replace_response_host: true
      end
      reverse_proxy /^\/changelog(\/?.*)$/, 'https://learnreact.github.io/changelog/'
    end
  end
end
