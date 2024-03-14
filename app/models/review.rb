class Review < ApplicationRecord
  belongs_to :listing

  include PgSearch::Model
end
