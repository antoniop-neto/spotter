class ReviewsController < ApplicationController
  before_action :set_listing, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = @listing
    if @review.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
      # this is when you fail to book, you will come back to new booking page
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
