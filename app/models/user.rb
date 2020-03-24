# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true, uniqueness: true, length: { maximum: 11 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, uniqueness: true
  enum gender: { 男性: 0, 女性: 1, その他: 2 }
  has_one :user_profile, dependent: :destroy
  has_many :applicants, dependent: :destroy
end
