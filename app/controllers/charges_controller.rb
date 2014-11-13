class ChargesController < ApplicationController



	def new

	end

	def create
	  amount = (params[:project][:amount].to_f*100).to_i
	  

	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:project][:token][:id]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => amount,
	    :description => 'Project donation',
	    :currency    => 'gbp'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end


end
