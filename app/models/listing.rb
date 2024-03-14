class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :location, :price, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
