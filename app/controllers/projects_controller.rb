class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10)
		if @projects.empty?
			render 'no_projects'
		end
	end

	def show
		@project = Project.find_by id: params[:id]
		render 'no_projects_found' unless @project
	end

end
