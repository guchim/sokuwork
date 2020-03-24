# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Aaron' }
    email { 'tester@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }
    phone_number { '09012345678' }
  end
end
