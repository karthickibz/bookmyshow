class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :events
  has_many :bookings

  def quantity_available(quantity_count,event_id)
		p 'event details'
		p event = Event.find_by(id: event_id)
		p 'booing quantity'
		p booking_quantity = Booking.where(event_id: event.id).sum(:quantity)
		p 'balance quantity'
		p bal = event.ticket - booking_quantity
		if bal > 0
			return true
		else
			return false
		end
	end
end

