class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
    @project = Project.create(project_params)
    redirect_to '/projects'
  end

   def project_params
    params.require(:project).permit(:title, :description)
  end

end
