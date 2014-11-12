class ProjectsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]


	def index
		@projects = Project.all
		@universities = University.all
		gon.universities = University.pluck(:name, :id)
	end

	def new
		@university = University.find(params[:university_id])
		@project = Project.new
	end

	def show
		# @university = University.find(params[:university_id])
		# @project = Project.find(params[:id])
		# @university = University.find(params[:university_id])
		# @project = @university.projects.find(params[:id])
		@project = Project.find(params[:id])

	end

	def create
		@university = University.find(params[:university_id])
		@project = @university.projects.new(project_params)
		@project.user = current_user
		@project.save
		redirect_to universities_path
	end

	def project_params
		params.require(:project).permit(:title, :description, :target_amount, :end_date, :image)
	end


end

class Customer
	def self.create
		# Amount in pence
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
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
