# frozen_string_literal: true

class OfferWalfare < ApplicationRecord
  belongs_to :offer
  belongs_to :walfare
end
