require 'rails_helper'

RSpec.describe Offer, type: :model do

 it "画像、タイトル、日付、出勤時間、退勤時間、仕事内容、注意事項、報酬、勤務先の住所の記述があれば有効な状態であること" do
  expect(FactoryBot.build(:offer)).to be_valid
 end

 it "画像がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, images: nil)
   offer.valid?
   expect(offer.errors[:images]).to include("を入力してください")
 end

 it "タイトルがなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, title: nil)
   offer.valid?
   expect(offer.errors[:title]).to include("を入力してください")
 end

 it "日付がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, date: nil)
   offer.valid?
   expect(offer.errors[:date]).to include("を入力してください")
 end

 it "出勤時間がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, start_time: nil)
   offer.valid?
   expect(offer.errors[:start_time]).to include("を入力してください")
 end

 it "退勤時間がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, end_time: nil)
   offer.valid?
   expect(offer.errors[:end_time]).to include("を入力してください")
 end

 it "仕事内容がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, contents: nil)
   offer.valid?
   expect(offer.errors[:contents]).to include("を入力してください")
 end

 it "注意事項がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, cautions: nil)
   offer.valid?
   expect(offer.errors[:cautions]).to include("を入力してください")
 end

 it "報酬がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, payment: nil)
   offer.valid?
   expect(offer.errors[:payment]).to include("を入力してください")
 end

 it "勤務先の住所がなければ無効な状態であること" do
   offer = FactoryBot.build(:offer, address: nil)
   offer.valid?
   expect(offer.errors[:address]).to include("を入力してください")
 end

 it 'タイトルが50文字以下であれば有効な状態であること' do
  character = 'a' * 50
  offer = FactoryBot.build(:offer, title: character)
  expect(offer).to be_valid
 end

 it 'タイトルが51文字であれば無効な状態であること' do
  character = 'a' * 51
  offer = FactoryBot.build(:offer, title: character)
  offer.valid?
  expect(offer.errors[:title]).to include("は50文字以内で入力してください")
 end

 it '仕事内容が200文字以下であれば有効な状態であること' do
  character = 'a' * 200
  offer = FactoryBot.build(:offer, contents: character)
  expect(offer).to be_valid
 end

 it '仕事内容が201文字であれば無効な状態であること' do
  character = 'a' * 201
  offer = FactoryBot.build(:offer, contents: character)
  offer.valid?
  expect(offer.errors[:contents]).to include("は200文字以内で入力してください")
 end

 it '注意事項が200文字以下であれば有効な状態であること' do
  character = 'a' * 200
  offer = FactoryBot.build(:offer, cautions: character)
  expect(offer).to be_valid
 end

 it '注意事項が201文字であれば無効な状態であること' do
  character = 'a' * 201
  offer = FactoryBot.build(:offer, cautions: character)
  offer.valid?
  expect(offer.errors[:cautions]).to include("は200文字以内で入力してください")
 end

 it '勤務先の住所が50文字以下であれば有効な状態であること' do
  character = 'a' * 50
  offer = FactoryBot.build(:offer, address: character)
  expect(offer).to be_valid
 end

 it '勤務先の住所が51文字であれば無効な状態であること' do
  character = 'a' * 51
  offer = FactoryBot.build(:offer, address: character)
  offer.valid?
  expect(offer.errors[:address]).to include("は50文字以内で入力してください")
 end

end
