class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :location, :price, presence: true
end
