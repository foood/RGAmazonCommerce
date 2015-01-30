I18n.load_path = Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
SpreeI18n::Config.available_locales = [:en, :ru]
