class BooksController < ApplicationController
	def index
		@library = Library.find(params[:library_id])
    	@books = Book.all
	end

	def show
		@library = Library.find(params[:library_id])
		@book = Book.find(params[:id])
		@book_issues = Issue.where(book_id: params[:id])
		@issue = Issue.new
	end

	def new
		@library = Library.find(params[:library_id])
		@book = Book.new
	end

	def edit
	  @library = Library.find(params[:library_id])
	  @book = Book.find(params[:id])
	end

	def create
    	@library = Library.find(params[:library_id])
    	@book = @library.books.create(book_params)
    	if @book.valid?
    		redirect_to library_books_path(@library)
    	else
			render 'new'
		end
  	end

  	def update
	  @library = Library.find(params[:library_id])
	  @book = Book.find(params[:id])
	  if @book.update(book_params)
	    redirect_to library_book_path(@library,@book)
	  else
	    render 'edit'
	  end
	end
 	
 	def destroy
		@library = Library.find(params[:library_id])
		@book = @library.books.find(params[:id])
		@book.destroy
		redirect_to library_books_path(@library)
	end
  private
    def book_params
      params.require(:book).permit(:name, :author, :cipher, :publ, :publ_y, :price, :date)
    end
end