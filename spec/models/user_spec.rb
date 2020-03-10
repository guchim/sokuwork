require 'rails_helper'

RSpec.describe User, type: :model do

 it "氏名、メールアドレス、パスワード、電話番号があれば有効な状態であること" do
  user = User.new(
    name: "Aaron",
    email: "tester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    phone_number: "09012345678"
  )
  expect(user).to be_valid
 end

 it "氏名がなければ無効な状態であること" do
  user = User.new(name: nil)
  user.valid?
  expect(user.errors[:name]).to include("を入力してください")
 end

 it 'メールアドレスがなければ無効な状態であること' do
  user = User.new(email: nil)
  user.valid?
  expect(user.errors[:email]).to include("を入力してください")
 end

 it '電話番号がなければ無効な状態であること' do
  user = User.new(phone_number: nil)
  user.valid?
  expect(user.errors[:phone_number]).to include("を入力してください")
 end

 it 'passwordがなければ無効な状態であること' do
  user = User.new(password: nil)
  user.valid?
  expect(user.errors[:password]).to include("を入力してください")
 end

 it 'passwordが存在してもpassword_confirmationがなければ無効な状態であること' do
  user = User.new(password_confirmation: '')
  user.valid?
  expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
 end

 it "重複したメールアドレスなら無効な状態であること" do
   User.create(
    name: "Joe Tester",
    email: "tester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    phone_number: "09011223344"
   )
   user = User.new(
    name: "Jane Tester",
    email: "tester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    phone_number: "09012345678"
   )
  user.valid?
  expect(user.errors[:email]).to include("はすでに存在します")
 end

 it "重複した電話番号なら無効な状態であること" do
   User.create(
    name: "Joe Tester",
    email: "test@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    phone_number: "09012345678"
   )
   user = User.new(
    name: "Jane Tester",
    email: "tester@example.com",
    password: "dottle-nouveau-pavilion-tights-furze",
    phone_number: "09012345678"
   )
  user.valid?
  expect(user.errors[:phone_number]).to include("はすでに存在します")
 end

 it 'nameが20文字以下なら登録できること' do
   user = User.new(
     name: "aaaaaaaaaaaaaaaaaaaa",
     email: "tester@example.com",
     password: "dottle-nouveau-pavilion-tights-furze",
     phone_number: "09012345678"
   )
  expect(user).to be_valid
 end

 it 'nameが21文字以上であれば無効な状態であること' do
  user = User.new(name: 'aaaaaaaaaaaaaaaaaaaaa')
  user.valid?
  expect(user.errors[:name]).to include("は20文字以内で入力してください")
 end

 it '電話番号が11文字以上であれば無効な状態であること' do
  user = User.new(phone_number: '090123456789')
  user.valid?
  expect(user.errors[:phone_number]).to include("は11文字以内で入力してください")
 end

 it 'passwordが8文字以上であれば有効な状態であること' do
   user = User.new(
     name: "Aaron",
     email: "tester@example.com",
     password: "password",
     phone_number: "09012345678"
   )
   expect(user).to be_valid
 end

 it 'passwordが7文字以下では無効な状態であること' do
  user = User.new(password: '0000000', password_confirmation: '0000000')
  user.valid?
  expect(user.errors[:password]).to include("は8文字以上で入力してください")
 end
end
