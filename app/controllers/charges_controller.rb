class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = params[:price].to_i*100

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Payement de ' + current_user.first_name + " " +current_user.last_name,
	    currency: 'eur',
	  })

		attendance = Attendance.create(
			stripe_customer_id: customer[:id],
			attendee: current_user,
			event: Event.find(params[:event_id]) 
			)
		flash[:success] = "Bien joué payement"
		redirect_to root_path
	rescue Stripe::CardError => e
	  flash[:error] = e.message

	  redirect_to attendance_path(params[:event_id])
	end
end
