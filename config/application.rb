require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module DspaceRestRuby
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end

DspaceRestRuby::Application.configure do
  config.api_server_url = "https://localhost:8443/rest"
  #config.api_server_url = "https://msdlib.home.nyu.edu/rest"


  ActiveRestClient::Base.faraday_config do |faraday|
    faraday.adapter(:net_http)
    faraday.ssl.verify_mode =  false
    faraday.options.timeout       = 10
    faraday.headers['User-Agent'] = "ActiveRestClient/#{ActiveRestClient::VERSION}"
  end


end



