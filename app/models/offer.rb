class Offer < ApplicationRecord
    mount_uploader :images, ImageUploader
    belongs_to:category
    belongs_to:company
    has_many:offer_walfares
    has_many:walfares, through: :offer_walfares
end
