CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJXLA642YTIRP24YQ',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'dice-shop'
end