class Api::ProjectsController < ApplicationController
	def index
		@projects = Project.all.includes(:entries)
	end

	def create
		@project = Project.create(project_params)
	end

	private

	def project_params
		params.require(:project).permit(:name)
	end
end
