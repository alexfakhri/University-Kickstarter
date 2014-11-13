class DonationsController < ApplicationController

before_action :authenticate_user!, :except => [:index]


	def index
	end

	def new
		@project = Project.find(params[:project_id])
		@donation = Donation.new
	end

	def create 
		@project = Project.find(params[:project_id])
		@donation = @project.donations.create(donation_params)
		@donation.user = current_user
		session[:donation_amount]=@donation.amount
		redirect_to '/charges/new'
	end

	def donation_params
		params.require(:donation).permit(:amount)
	end

end
