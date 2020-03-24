# frozen_string_literal: true

class Walfare < ApplicationRecord
  has_many :offer_walfares, dependent: :destroy
  has_many :offers, dependent: :destroy
end
