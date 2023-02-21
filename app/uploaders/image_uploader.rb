class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [800, 200]

  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  
  
end
