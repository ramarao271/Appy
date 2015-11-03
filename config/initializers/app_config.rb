app_config_var = Rails.application.config_for :app_config
Rails.application.configure do
  config.app = ActiveSupport::OrderedOptions.new
  config.app.api_key = app_config_var[:api_key]
  config.app.secret = app_config_var[:secret]
  config.app.redirect_uri = app_config_var[:redirect_uri]
  config.app.scope = app_config_var[:scope]
  config.app.embedded_app = app_config_var[:true]
end