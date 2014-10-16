# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# The application uses separate manifest files for all editing related styles and JavaScript, which
# are only loaded if required. They need to be integrated into Ruby on Rails asset pipeline.
Rails.application.config.assets.precompile += %w(editing.css editing.js)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
