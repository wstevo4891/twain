# Photo Uploader for Bolt Network Site
class BoltNetworkUploader < ImageUploader
  def initialize(*)
    super
    fog_credentials[:region] = 'us-west-2'
    self.fog_directory = ENV['BOLT_NETWORK_BUCKET']
  end

  def filename
    "#{mounted_as}.#{file.extension}" if original_filename.present?
  end

  def production_dir
    "movies/#{model.slug}"
  end
end
