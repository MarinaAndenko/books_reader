# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

  version :book do
    process resize_to_fill: [200,200]
  end
  version :preview do
    process resize_to_fill: [75,75]
  end

end
