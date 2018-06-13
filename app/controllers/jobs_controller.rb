class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
		@boat = Boat.find(@job.boat_id)
		@user = User.find(@job.user_id)
	end

	def new
		@boats = Boat.all.map{ |boat| [ boat.name, boat.id ] }
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.user_id = current_user.id
		@job.boat_id = params[:boat_id]
		if @job.save!
			redirect_to "/jobs/"
		else
			render "/jobs/new"
		end
	end

	def destroy
		job = Job.find(params[:id])
		job.destroy
		flash[:message] = "job deleted"
		redirect_to "/jobs/"
	end

	def edit
		@boats = Boat.all.map{ |boat| [ boat.name, boat.id ] }
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.user_id = current_user.id
		job_params[:boat_id] = params[:boat_id]
		if @job.update!(job_params)
			flash[:message] = "job updated!"
			redirect_to "/jobs/"
		else
			render edit_job_path
		end
	end

	private
	def job_params
		params.require(:job).permit(:title,:info, :origin, :destination, :cost, :containers, :boat_id, :user_id)
	end

end