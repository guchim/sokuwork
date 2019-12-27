class Offer < ApplicationRecord
    belongs_to:category
    belongs_to:walfare
    mount_uploader :images,ImageUploader
end
