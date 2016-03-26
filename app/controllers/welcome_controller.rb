class WelcomeController < ApplicationController
	before_action :authenticate_user!


	def index
		if params[:search]
			@my_events = Event.where(name: params[:search])
		else
			@events = Event.all
			@my_events = Event.where(user_id: current_user.id)
			@other_events = Event.where.not(user_id: current_user.id)
		end
	end
	
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params.require(:event).permit(:name,:attachment,:category_id,:user_id,:place,:ticket,:ticket_amount,:expire_date))
		@event.save
		flash[:notice] = "Event successfully created"
		redirect_to welcome_index_path
	end
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		flash[:notice] = "Event successfully Deleted"
		redirect_to welcome_index_path
	end
	
end
