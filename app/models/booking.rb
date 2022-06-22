class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :comments, presence: true
  belongs_to :service
  belongs_to :user
end
