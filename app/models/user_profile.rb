class UserProfile < ApplicationRecord
    mount_uploader :profile_photo, ImageUploader
    belongs_to:user
end
