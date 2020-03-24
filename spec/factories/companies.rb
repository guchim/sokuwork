# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'ビニコンアイウエオ店' }
    email { 'company@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }
    phone_number { '09012345678' }
  end
end
