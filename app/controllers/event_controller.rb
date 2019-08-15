class EventController < ApplicationController

	def end_date?(event)
		event.start_date + DateTime.new(0,0,0,0,event.duration,0 )
	end

	def index
		@events = Event.all
	end

	def show
		@urls = [
			"https://images.pexels.com/photos/2744596/pexels-photo-2744596.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
			"https://images.pexels.com/photos/788485/pexels-photo-788485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
			"https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"]
		@event = Event.find(params[:id])
		@event_end = @event.start_date + @event.duration.minutes
	end

	def new
		@event = Event.new
	end
	
	def create
		event = Event.new(
			title: params[:title],
			description: params[:description],
			location: params[:location],
			start_date:  DateTime.new(params[:start_date].values[0].to_i, params[:start_date].values[1].to_i, params[:start_date].values[2].to_i, params[:start_date].values[3].to_i, params[:start_date].values[4].to_i, 0),
			price: params[:price],
			duration: params[:duration],
			administrator: current_user
			)
		event.save
		redirect_to event_index_path
	end

end