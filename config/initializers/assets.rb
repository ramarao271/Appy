# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( customers.js )
Rails.application.config.assets.precompile += %w( fb.js )
Rails.application.config.assets.precompile += %w( customer.js )
Rails.application.config.assets.precompile += %w( bootstrap-table.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-table.js )
Rails.application.config.assets.precompile += %w( jquery-1.11.3.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-responsive.css )
Rails.application.config.assets.precompile += %w(jquery.bootstrap-responsive-tabs.min.js)
Rails.application.config.assets.precompile += %w(bootstrap-responsive-tabs.css)
# Rails.application.config.assets.precompile += %w(image-picker.js)
# Rails.application.config.assets.precompile += %w(show_html.js)
# Rails.application.config.assets.precompile += %w(jquery.masonry.min.js)
# Rails.application.config.assets.precompile += %w(prettify.js)
# Rails.application.config.assets.precompile += %w(image-picker.css)
# Rails.application.config.assets.precompile += %w(examples.css)
# 
# 
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
