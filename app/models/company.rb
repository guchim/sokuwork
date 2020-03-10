class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true, uniqueness: true, length: { maximum: 11 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, uniqueness: true
  has_many :offers, dependent: :destroy
  has_many :applicants
end
