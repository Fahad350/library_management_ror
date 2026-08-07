class BooksController < ApplicationController
    before_action :set_author
    before_action :set_book, only: [:show, :edit, :update, :destroy]
     def index
        @books = @author.books
    end

    def new
        @book = @author.books.new
    end

    def show
    end 

    def edit
    end

    def create
       @book = @author.books.new(book_params)
       if @book.save
        redirect_to author_books_path(@author), notice: "Book created successfully!"
       else
        render :new, status: :unprocessable_entity
       end
        
    end

    def update
        if @book.update(book_params)
        redirect_to author_books_path(@author), notice: "books updated!"
     else 
        render :edit, status: :unprocessable_entity
     end
    end

    def destroy
        @book.destroy
        redirect_to author_books_path(@author), notice: "books deleted successfully!"
    end

    private
   def set_book
    @book = @author.books.find(params[:id])
   end

   def set_author
  @author = Author.find(params[:author_id])
end
def book_params
  params.require(:book).permit(:title, :price)
end

end
