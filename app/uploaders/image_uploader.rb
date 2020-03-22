# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args) 
    "unknown.jpg"
  end

  # リサイズ
  process resize_to_fill: [200, 200, 'Center']

  # JPGで保存
  process convert: 'jpg'

  # サムネイルを生成
  #  version :thumb do
  #    process resize_to_limit: [300, 300]
  #  end

  # jpg,jpeg,gif,pngのみ
  def extension_white_list
    %w[jpg jpeg gif png]
  end

  # ファイル名を変更し拡張子を同じにする
  def filename
    super.chomp(File.extname(super)) + '.jpg'
  end

  # 日付で保存
  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end
end
def default_url(*args)
#   # For Rails 3.1+ asset pipeline compatibility:
#   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
"unknown.jpg"
#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
end
