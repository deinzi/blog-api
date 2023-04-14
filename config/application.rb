require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.session_store :cookie_store, key: '_my_api_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options.merge({
      same_site: :none,
      secure: true
    })

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'https://6439d3f0bb74eb00085a2070--stalwart-gumption-b1f965.netlify.app'
    }


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
