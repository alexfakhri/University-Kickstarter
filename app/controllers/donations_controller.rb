class DonationsController < ApplicationController

before_action :authenticate_user!, :except => [:index]


  def index

  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
  end

  def create 

   
    # redirect_to '/projects' 
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:donation][:token][:id]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:donation][:amount],
      :description => 'Project donation',
      :currency    => 'gbp'
    )

    @project = Project.find(params[:project_id])
    @donation = @project.donations.new(donation_params)
    @donation.user = current_user
    @donation.save
    
    # render json: {message: "Donation successful"}
    render js: "window.location.pathname='#{project_path(@project)}'"

    rescue Stripe::CardError => e
      render status: 402, json: {message: e.message}
      p e.inspect

  end



#     create charge
#     if successful
#       create donation
#     end

 
#       else
#         flash[:notice] = "This donation did not work"
#         render 'new'
#       end
#   end

  def donation_params
    params.require(:donation).permit(:amount)
  end

end
