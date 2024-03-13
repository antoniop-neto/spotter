class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def manage
    @user = current_user
    @listings = current_user.listings
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end
end
