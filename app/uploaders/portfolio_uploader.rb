# Image Uploader for Portfolio Site
class PortfolioUploader < ImageUploader
  def initialize(*)
    super
    self.fog_directory = ENV['PORTFOLIO_BUCKET']
  end

  def production_dir
    "#{fog_directory}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
