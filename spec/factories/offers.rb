# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    association :company
    association :category
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    title { '渋谷区のライブ会場でライブ運営のお手伝い' }
    date { '2020-01-01' }
    start_time { '10:00' }
    end_time { '20:00' }
    contents { 'ライブ会場でのチケットの管理をしていただきます' }
    cautions { '黒髪、白か黒を基調とした服（ライブ限定のジャージをお渡しします）' }
    payment { '10000' }
    address { '東京都渋谷区即WORK町2-15' }
  end
end
