class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  validates :name, :location, :price, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [:name, :location],
    using: {
      tsearch: { prefix: true }
    }

  def average_rating
    reviews.average(:rating)&.round(2) || "No ratings yet"
  end
end
