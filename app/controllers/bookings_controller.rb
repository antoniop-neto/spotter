class BookingsController < ApplicationController

  before_action
  def index
    @bookings = Booking.all
  end
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = @offer.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to @booking, notice: 'booking is successful'
    else
      render :new, status: :unprocessable_entity
      # this is when you fail to book, you will come back to new booking page
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
    
  private

  def set_listing
    @listing = Listing.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:number_of_guests, :booking_date)
    # check the booking to insure information is correct
  end

end
