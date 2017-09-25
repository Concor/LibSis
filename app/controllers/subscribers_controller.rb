class SubscribersController < ApplicationController
	def index
		@library = Library.find(params[:library_id])
    	@subscribers = Subscriber.all
	end

	def show
		@library = Library.find(params[:library_id])
    	@subscriber = Subscriber.find(params[:id])
    	@issues = Issue.where(subscriber_id: params[:id])
	end

	def new
		@library = Library.find(params[:library_id])
		@subscriber = Subscriber.new
	end

	def edit
	  @library = Library.find(params[:library_id])
	  @subscriber = Subscriber.find(params[:id])
	end

	def create
		@library = Library.find(params[:library_id])
		@subscriber = @library.subscribers.create(subscriber_params)
		if @subscriber.valid?
			redirect_to library_subscriber_path(@library,@subscriber)
    	else
			render 'new'
		end
	end
		

	def update
	  @library = Library.find(params[:library_id])
	  @subscriber = Subscriber.find(params[:id])
	  if @subscriber.update(subscriber_params)
	    redirect_to library_subscriber_path(@library,@subscriber)
	  else
	    render 'edit'
	  end
	end

	def destroy
		@library = Library.find(params[:library_id])
		@subscriber = @library.subscribers.find(params[:id])
		@subscriber.destroy
		redirect_to library_subscribers_path(@library)
	end

	private
	  def subscriber_params
	    params.require(:subscriber).permit(:fname, :sname, :mname, :number, :phone, :address)
	  end
end
