class UniversitiesController < ApplicationController


	def index
		@universities = University.all
	end

	def new
		@university = University.new
	end

	def show
		@university = University.find(params[:id])
		# @project = @university.projects.find(params[:id])
	end

	def create
    @university = University.create(project_params)
    redirect_to '/universities'
  end

   def project_params
    params.require(:university).permit(:name, :description, :image)
  end


end
