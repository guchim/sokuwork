# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # 環境ごとに保存先変更/デフォルトではstorage :fileがコメントアウトで入っている
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

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*_args)
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    'unknown.jpg'
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # jpg,jpeg,gif,pngのみ
  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
