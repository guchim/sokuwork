require 'rails_helper'

RSpec.describe User, type: :model do
 # 姓、名、メール、パスワードがあれば有効な状態であること
 it "is valid with a first name, last name, email, and password" do
  user = User.new(
    name: "Aaron",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  expect(user).to be_valid
 end
 # 名がなければ無効な状態であること
 it "is invalid without a name" do
  user = User.new(name: nil)
  user.valid?
  expect(user.errors[:name]).to include("を入力してください")
 end
 # メールアドレスがなければ無効な状態であること
 it "is invalid without an email address"
 # 重複したメールアドレスなら無効な状態であること
 it "is invalid with a duplicate email address" do
   User.create(
    name:  "Joe Tester",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
   )
   user = User.new(
    name:  "Jane Tester",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  user.valid?
  expect(user.errors[:email]).to include("はすでに存在します")
end
 # ユーザーのフルネームを文字列として返すこと
 it "returns a user's full name as a string"
end
