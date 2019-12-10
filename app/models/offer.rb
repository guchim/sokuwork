class Offer < ApplicationRecord
    belongs_to:category
    belongs_to:company
    mount_uploader :images, ImageUploader
end
