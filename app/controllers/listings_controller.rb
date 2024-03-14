class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = Listing.all
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @markers = [
      {
        lat: @listing.latitude,
        lng: @listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: @listing })
      }
    ]
  end

  def manage
    @user = current_user
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |form|
      if @listing.save
        form.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        form.json { render :show, status: :created, location: @listing }
      else
        form.html { render :new, status: :unprocessable_entity }
        form.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
    # if @listing.save
    #   redirect_to listings_path(@listings)
    # else
    #   render :new, status: :unprocessable_entity
    #   # this is when you fail to book, you will come back to new booking page
    # end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :location, :price, :photo, :user_id)
  end
end
