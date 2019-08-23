class AttendanceController < ActionController::Base

	def new
	end

	def create
	end

	def show
		@event = Event.find(params[:id])
	end
end
