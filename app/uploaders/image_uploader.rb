# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    store_dir_base(model.class, model.id)
  end

  def store_dir_base(modelclass, id)
    "uploads/#{modelclass.to_s.pluralize.underscore}/#{id}"
  end

  version :small do
    process :resize_to_fill => [155, 155]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
