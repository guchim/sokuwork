# frozen_string_literal: true

class UserProfile < ApplicationRecord
  mount_uploader :profile_photo, ImageUploader
  validates :introduction, length: { maximum: 200 }
  belongs_to :user
end
