# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "offer_category#{n}" }
  end
end
