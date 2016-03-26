class HomesController < ApplicationController
  def index
		if params[:search]
			@events = Event.where(name: params[:search])
		else
			@events = Event.all
		end
	end
	
	def new
		@event = Event.new()
	end
end
