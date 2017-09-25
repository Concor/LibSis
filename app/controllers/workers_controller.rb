class WorkersController < ApplicationController
	def new
		@library = Library.find(params[:library_id])
		@worker = Worker.new
	end

	def edit
	  @library = Library.find(params[:library_id])
	  @worker = Worker.find(params[:id])
	end

	def create
    	@library = Library.find(params[:library_id])
    	@worker = @library.workers.create(worker_params)
    	if @worker.valid?
    		redirect_to library_path(@library)
    	else
			render 'new'
		end
  	end
 	

	def update
	  @library = Library.find(params[:library_id])
	  @worker = Worker.find(params[:id])
	  if @worker.update(worker_params)
	    redirect_to @library
	  else
	    render 'edit'
	  end
	end
	
	def destroy
		@library = Library.find(params[:library_id])
		@worker = @library.workers.find(params[:id])
		@worker.destroy
		redirect_to library_path(@library)
	end

	private
	  def worker_params
	    params.require(:worker).permit(:fname, :sname, :mname, :birthday, :start_date, :education, :post, :avatar)
	  end
end
