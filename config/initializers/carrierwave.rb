# config/initializers/carrierwave.rb

# Configure carrierwave image storage by environment

# Use local storage in development & test
if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

# Use AWS storage in production
if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_KEY']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.fog_public = true
  end
end

# Store uploads in spec/support/uploads in test environment
if Rails.env.test?
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/support/uploads/#{mounted_as}/#{model}"
      end
    end
  end
end
