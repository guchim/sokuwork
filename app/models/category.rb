# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :offers, dependent: :destroy
end
