class DonationsController < ApplicationController

	def index
	end

	def new
		@project = Project.find(params[:project_id])
		@donation = Donation.new
	end

	def create 
		@project = Project.find(params[:project_id])
		@donation = @project.donations.new(donation_params)
		@donation.user = current_user
		redirect_to '/'
	end

	def donation_params
		params.require(:donation).permit(:amount)
	end

end
