# config/initializers/load_config.rb
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

# application.rb
if APP_CONFIG && APP_CONFIG['scrivito_icon_box_widget']['colors']
  Rails.configuration.icon_box_colors = APP_CONFIG['scrivito_icon_box_widget']['colors']
end
