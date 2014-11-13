class ChargesController < ApplicationController



	def new

	end

	def create
	  # Amount in pence
	  params.inspect
	  @amount = session[:donation_amount].dup
	  session[:donation_amount] = 0
	  p session

	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Project donation',
	    :currency    => 'gbp'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end


end
