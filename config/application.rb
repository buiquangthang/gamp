require_relative 'boot'

require 'rails/all'
require 'csv'
require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gmap
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initialize rs
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib/dijkstra)
    config.autoload_paths += Dir["#{config.root}/lib/dijkstra/**/"]
    config.watchable_dirs['lib'] = [:rb]
  end
end
