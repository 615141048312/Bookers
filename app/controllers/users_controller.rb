class UsersController < ApplicationController
  def index
  	@user = current_user
    @new_book = Book.new
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @new_book = Book.new
  	@books = Book.where(user_id: params[:id])
  end

  def edit
  end

  def update
  end
end
