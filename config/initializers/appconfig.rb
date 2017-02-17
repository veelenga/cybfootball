EMAIL = YAML.load_file(Rails.root.join 'config/email.yml')[Rails.env]
