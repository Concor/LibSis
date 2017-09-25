class IssuesController < ApplicationController
  def edit
    @library = Library.find(params[:library_id])
    @issue = Issue.find(params[:id])
    @book = Book.find(@issue.book_id)
    @subscriber = Subscriber.find(@issue.subscriber_id)
  end
	def create
      @library = Library.find(params[:library_id])
      if !params[:issue][:book_id].nil?
        @book = Book.find(params[:issue][:book_id])
        #@book_issues = Issue.where(book_id: @book.id)

        if @subscriber = Subscriber.find_by(library_id: @library.id, number: params[:number])
          @book.issues.create(book_id: @book.id, subscriber_id: @subscriber.id, d_start: params[:issue][:d_start], d_end: params[:issue][:d_end])
          redirect_to library_book_path(@library,@book)
        else
          #render "books/show"
          redirect_to library_book_path(@library,@book, error_serch: 1, number: params[:number])
        end
      end
    	if !params[:issue][:subscriber_id].nil?
        @subscriber = Subscriber.find(params[:issue][:subscriber_id])
        #@book_issues = Issue.where(book_id: @book.id)

        if @book = Book.find_by(library_id: @library.id, cipher: params[:cipher])
          @subscriber.issues.create(book_id: @book.id, subscriber_id: @subscriber.id, d_start: params[:issue][:d_start], d_end: params[:issue][:d_end])
          redirect_to library_subscriber_path(@library,@subscriber)
        else
          #render "books/show"
          redirect_to library_subscriber_path(@library,@subscriber, error_serch: 1, cipher: params[:cipher])
        end
      end
  	end

    def update
      @library = Library.find(params[:library_id])
      @issue = Issue.find(params[:id])
      if @issue.update(issue_params)
        redirect_to edit_library_issue_path(@library,@issue)
      else
        render 'edit'
      end
    end

    def destroy
      @library = Library.find(params[:library_id])
      @issue = Issue.find(params[:id])
      @issue.destroy
      redirect_to library_subscriber_path(@library,@issue.subscriber_id)
    end

  	private
    def issue_params
      params.require(:issue).permit(:d_start, :d_end)
    end
end
