# frozen_string_literal: true

class Offer < ApplicationRecord
  mount_uploader :images, ImageUploader
  validates :images, presence: true
  belongs_to :category
  belongs_to :company
  has_many :offer_walfares, dependent: :destroy
  has_many :applicants, dependent: :destroy
  has_many :walfares, through: :offer_walfares, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :contents, presence: true, length: { maximum: 200 }
  validates :cautions, presence: true, length: { maximum: 200 }
  validates :payment, presence: true
  validates :address, presence: true, length: { maximum: 50 }
end
