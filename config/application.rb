require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Dotenv::Railtie.load if defined?(Dotenv)
Bundler.require(*Rails.groups)


module Rails7DeviseExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.assets.css_compressor = nil
    config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, BigDecimal, ActiveSupport::TimeWithZone, ActiveSupport::TimeZone]
    config.time_zone = 'Asia/Manila'
    config.active_record.default_timezone = :utc
  end
end
