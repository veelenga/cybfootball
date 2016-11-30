require 'aws-sdk'

aws = YAML.load(ERB.new(File.read("#{Rails.root}/config/aws.yml")).result)[Rails.env]

aws.present? && Aws.config.update({
  region: 'eu-central-1',
  credentials: Aws::Credentials.new(aws['access_key_id'], aws['secret_access_key'])
})
