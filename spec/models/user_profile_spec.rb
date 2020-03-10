require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  it "自己紹介文がなくともプロフィール画像を更新できること" do
   expect(FactoryBot.build(:user_profile, introduction: nil)).to be_valid
  end

  it "プロフィール画像がなくとも自己紹介文を更新できること" do
   expect(FactoryBot.build(:user_profile, profile_photo: nil)).to be_valid
  end

  it '自己紹介文が200文字以下であれば有効な状態であること' do
   character = 'a' * 200
   profile = FactoryBot.build(:user_profile, introduction: character)
   expect(profile).to be_valid
  end

  it '自己紹介文が201文字であれば無効な状態であること' do
   character = 'a' * 201
   profile = FactoryBot.build(:user_profile, introduction: character)
   profile.valid?
   expect(profile.errors[:introduction]).to include("は200文字以内で入力してください")
  end
end
