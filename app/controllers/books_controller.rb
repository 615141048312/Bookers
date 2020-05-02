class BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  def index
  	@user = current_user
    @new_book = Book.new
  	@books = Book.all
  end
  def show
  	@user = user.find(params[:id])
    @new_book = Book.new
  	@book = Book.find(params[:id])
  end
  def edit
  end
  def destroy
  end
  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
