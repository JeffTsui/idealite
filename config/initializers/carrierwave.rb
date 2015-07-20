# Initialize CarrierWave AWS S3

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIKBG33ARNSRC6J4A',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'idealite' # bucket name
  config.enable_processing = true
end

# Image processing
MiniMagick.configure do |config|
  config.debug = true
end