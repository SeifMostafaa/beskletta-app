class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process resize_to_fit: [50, 50]

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/thumb"
    end
  end

  version :small do
    process resize_to_fit: [200, 200]

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/small"
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "tmp/uploads/cache/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    "/assets/defaults/#{model.class.to_s.underscore}.jpg"
  end

  def extension_whitelist
    %w[jpg jpeg gif png webp]
  end
end
