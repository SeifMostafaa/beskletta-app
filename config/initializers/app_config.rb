# frozen_string_literal: true

class AppConfig
  def self.load
    config_file = File.join(Rails.root, "config", "app_config.yml")

    if File.exist?(config_file)
      #config = YAML.safe_load(ERB.new(File.read(config_file)).result, [], [], true)["default"].merge(YAML.safe_load(ERB.new(File.read(config_file)).result, [], [], true)[::Rails.env])
      config = YAML.safe_load(ERB.new(File.read(config_file)).result, aliases: true)["default"].merge(YAML.safe_load(ERB.new(File.read(config_file)).result, aliases: true)[::Rails.env])
      config.keys.each do |key|
        cattr_accessor key
        send("#{key}=", config[key])
      end
    end

    update_rails_settings
  end

  def self.method_missing(*_args)
    p
    nil
  end

  def self.update_rails_settings
    Rails.application.routes.default_url_options[:host] = AppConfig.domain_name
    Rails.application.config.asset_host = AppConfig.host_url
  end
end

AppConfig.load
