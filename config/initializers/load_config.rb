APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

Shirtsio.configure do |config|
  config.api_key = APP_CONFIG['api_key']
end