class UsersController < ApplicationController
def show
 @user = User.find(params[:id])
 @books = @user.books
end

def edit
  @user = User.find(params[:id])
unless @user.id == current_user.id
  redirect_to user_path(current_user)
end
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  else
    render :edit
  end
end

def index
  @users = User.all
end

private
def user_params
  params.require(:user).permit(:name,:introduction, :profile_image)
end
end