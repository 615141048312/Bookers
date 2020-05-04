class UsersController < ApplicationController

  def root
  end

  def about
  end

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
