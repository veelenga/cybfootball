I18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.yml')]
I18n.enforce_available_locales = true
I18n.available_locales = [:en, :uk]
I18n.default_locale = :uk
