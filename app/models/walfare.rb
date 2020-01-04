class Walfare < ApplicationRecord
    has_many:offer_walfares
    has_many:offers, through: :offer_walfares
end
