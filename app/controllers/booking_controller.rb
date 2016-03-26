class BookingController < ApplicationController
	before_action :authenticate_user!
  before_action :user_method
	
  def index
    # if session[:booking_id].present?
  		# p @booking = Booking.where(user_id: current_user.id).where(id: session[:booking_id])
    #   @event = Event.find_by(id: @booking.event_id)
    # end
    @booking = Booking.find_by(id: params[:booking])
    @event = Event.find_by(id: @booking.event_id)
    # @bookings = Booking.where(user_id: current_user.id)

  end

  def new
  		@booking = Booking.new
      @event = Event.find_by(id: params[:event_id])
      @bookings_quantity = Booking.where(event_id: @event.id).sum(:quantity)

  end

  def create
    @event_ticket_amt = Event.find_by(id: params[:booking][:event_id]).ticket_amount
    if @user.quantity_available(params[:booking][:quantity],params[:booking][:event_id])
    	@booking = Booking.new(params.require(:booking).permit(:quantity,:amount,:event_id,:user_id,:status))
  		if @booking.save
        p @booking
        @booking.update_attributes(amount: @booking.quantity * @event_ticket_amt )
        # session[:booking_id] = @booking.id
    		redirect_to booking_index_path(booking: @booking)
     end
    else
      redirect_to booking_new_path
    end
  end

  def previous_booking_list
    @bookings = Booking.where(user_id: current_user.id)
  end
  private
    def user_method
      @user = User.find_by(id: current_user.id)
    end
end


