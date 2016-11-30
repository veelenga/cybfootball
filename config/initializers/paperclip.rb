paperclip = YAML.load(ERB.new(File.read("#{Rails.root}/config/paperclip.yml")).result)[Rails.env]

Paperclip::Attachment.default_options.merge!(paperclip.symbolize_keys)
