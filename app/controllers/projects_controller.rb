class ProjectsController < ApplicationController

before_action :authenticate_user!

	def index
		@projects = current_user.projects.last_created_projects(10)
		if @projects.empty?
			render 'no_projects'
		end
	end

	def show
		@project = current_user.projects.find_by id: params[:id]
		render 'no_projects_found' unless @project
	end

end
