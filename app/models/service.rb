class Service < ApplicationRecord
  validates :category, presence: true
  validates :description, presence: true
  validates :cost, presence: true
  validates :title, presence: true
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
end
