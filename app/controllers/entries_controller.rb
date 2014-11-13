class EntriesController < ApplicationController

	before_action :authenticate_user!



	def index
		@project = Project.find_by id: params[:project_id]
		@entries = @project.entries
	end

	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params

		if @entry.save
			flash[:notice] = "Entry created succesfully"
			UserMailer.entry_created(@project).deliver
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end

	def update
		@project = Project.find params[:project_id]
		@entry = project.entries.find params[:id]

		if @entry.update_atribbutes entry_params
			redirect_to action: :show, controller: :entries, project_id: @project_id, id: @entry.id
		else
			render 'edit'
		end
	end

	def show
		@project = Project.find_by id: params[:project_id]
		@entries = @project.entries
	end

	def destroy
		@project = Project.find_by id: params[:project_id]
		@entry = @project.entries.find params[:id]

		if @entry.destroy
			redirect_to action: :index
		else
			redirect_to :back
		end
	end


	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end

end
