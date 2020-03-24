# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    association :user
    profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    introduction { '' }
  end
end
