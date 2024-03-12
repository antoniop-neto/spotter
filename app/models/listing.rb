class Listing < ApplicationRecord
  belongs_to :user

  validates :name, :location, :price, presence: true
end
