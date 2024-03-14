class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  validates :name, :location, :price, presence: true

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
