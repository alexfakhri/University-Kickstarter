class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	
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
		@project = @university.projects.create(project_params)
		redirect_to universities_path
	end

	def project_params
		params.require(:project).permit(:title, :description, :target_amount, :end_date, :image)
	end


end
