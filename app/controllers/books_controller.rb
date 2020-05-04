class BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def index
  	@user = current_user
    @new_book = Book.new
  	@books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    #user.id == @book.user_id
  	@user = User.find_by(id: @book.user_id)
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    user = current_user
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
