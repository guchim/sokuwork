# frozen_string_literal: true

class Walfare < ApplicationRecord
  has_many :offer_walfares
  has_many :offers
end
